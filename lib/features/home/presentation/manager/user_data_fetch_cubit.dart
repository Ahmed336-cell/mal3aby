import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/features/auth/data/profile.dart';

class UserDataFetchCubit extends Cubit<Profile?>{
  UserDataFetchCubit():super(null);
  void fetchUserData(String userId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('user').doc(userId).get();
      if (docSnapshot.exists) {
        Profile profile = Profile.fromFirestore(docSnapshot);
        emit(profile);
      } else {
        emit(null);
      }
    } catch (e) {
      print(e);
    }
  }
}