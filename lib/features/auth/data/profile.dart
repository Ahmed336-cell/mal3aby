import 'package:cloud_firestore/cloud_firestore.dart';

class Profile{
  String ?name;
  String? password;
  String ?phoneNumber;
  String ?email;
  String ?profileId;
  String ?governorate;
  String?authorization;




  Profile({
    this.name,
    this.password,
    this.phoneNumber,
    this.email,
    this.profileId,
    this.governorate,
    this.authorization});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'userId': profileId,
      'governorate': governorate,
      'authorization': authorization,

    };
  }


  factory Profile.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Profile(
        name: data['name'],
        password: data['password'],
        phoneNumber: data['phoneNumber'],
        email: data['email'],
        profileId: data['userId'],
        governorate: data['governorate'],
        authorization: data['authorization'],
    );
  }

}