import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/data/pitch.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../features/auth/data/profile.dart';

class FirebaseFunctions {
  static Future<void> addUserToFirestore(
      {required String name, required String email, required String phoneNumber, required String userId, String govern = "null", required String authType}) async {
    Profile profile = Profile(name: name,
        email: email,
        phoneNumber: phoneNumber,
        profileId: userId,
        governorate: govern,
        authorization: authType);
    Map<String, dynamic> profileMap = profile.toMap();
    try {
      await FirebaseFirestore.instance.collection(authType).doc(userId).set(
          profileMap
      );
      print('User added to Firestore successfully.');
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  static Future<void> addPitchToFirestore({
    required String pitchName,
    required String govern,
    required String address,
    required String? userId,
    String mapLink = "null",
    required String pitchType,
    required String price,
    required List<String> images,
    required String ownerName,
    required String phoneNumber
  }) async {
    try {
      DocumentReference docRef = FirebaseFirestore.instance
          .collection('owner')
          .doc(userId)
          .collection('pitch')
          .doc();

      DocumentReference pitchesRef = FirebaseFirestore.instance
          .collection('pitches')
          .doc();

      String pitchId = docRef.id; // Generate pitchId

      Pitch pitch = Pitch(
        pitchName: pitchName,
        pitchGovernement: govern,
        address: address,
        mapLink: mapLink,
        typeOfPitch: pitchType,
        price: price,
        OwnerId: userId,
        imageList: images,
        pitchId: pitchId,
        ownerName: ownerName,
        phoneNumber: phoneNumber
      );

      Map<String, dynamic> pitchMap = pitch.toMap();

      await docRef.set(pitchMap);
      await pitchesRef.set(pitchMap);
      print('Pitch added to Firestore successfully.');
    } catch (e) {
      print('Error adding pitch to Firestore: $e');
    }
  }

  static Future<List<String>> uploadImages(List<String> imagePaths, String profileId) async {
    final storage = firebase_storage.FirebaseStorage.instance;
    final firestore = FirebaseFirestore.instance;
    List<String> imageUrls = []; // List to store image URLs

    for (var path in imagePaths) {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      final firebase_storage.Reference ref = storage.ref("pitchesImages").child(profileId).child('$imageName.jpg');
      final firebase_storage.UploadTask uploadTask = ref.putFile(File(path));

      await uploadTask.whenComplete(() async {
        String url = await ref.getDownloadURL();
        imageUrls.add(url);
      });
    }
    return imageUrls;
  }


  static Future<void> addReservationToFirestore(
  {required Profile profile, required Pitch pitch, required String paymentStatues ,required DateTime date , required TimeOfDay startTime, required TimeOfDay endTime }) async {
    Map<String,String>resData= {
      "pitchName":pitch.pitchName!,
      "pitchTyoe":pitch.typeOfPitch!,
      "userName":profile.name!,
      "userId":profile.profileId!,
      "pitchId":pitch.pitchId!,
      "date":date.day.toString()!+"/"+date.month.toString()! ,
      "startTime":startTime.hour.toString() ,
      "endTime":endTime.hour.toString(),
      "ownerId":pitch.OwnerId!,
      "paymentStatus":paymentStatues
    };
  try {
  await FirebaseFirestore.instance.collection('owner').doc(pitch.OwnerId).collection("reservations").doc().set(
 resData
  );
  await FirebaseFirestore.instance.collection('user').doc(profile.profileId).collection("reservations").doc().set(
      resData
  );
  await FirebaseFirestore.instance.collection('reservation').doc().set(
      resData
  );
  print('User added to Firestore successfully.');
  } catch (e) {
  print('Error adding user to Firestore: $e');
  }
  }
}