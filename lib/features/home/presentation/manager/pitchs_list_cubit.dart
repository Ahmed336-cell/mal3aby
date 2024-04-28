import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/features/home/data/pitch.dart';

class DataFetchingPitchsCubit extends Cubit<List<Pitch>> {
  DataFetchingPitchsCubit() : super([]);

  void fetchListOfPitchesOwnerData(String userId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('owner').doc(userId).collection('pitch').get();
      List<Pitch> pitches = querySnapshot.docs.map((doc) => Pitch.fromFirestore(doc)).toList();
      emit(pitches);
    } catch (e) {
      print(e);
    }
  }

  void fetchListOfPitchesUserData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('pitches').get();
      List<Pitch> pitches = querySnapshot.docs.map((doc) => Pitch.fromFirestore(doc)).toList();
      emit(pitches);
    } catch (e) {
      print(e);
    }
  }


}