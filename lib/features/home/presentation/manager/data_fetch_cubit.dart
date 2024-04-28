import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/features/home/data/pitch.dart';


class DataFetchingCubit extends Cubit<Pitch?> {
  DataFetchingCubit() : super(null);

  void fetchDataPitch(String ownerId,String pitchId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance.collection('owner').doc(ownerId).collection("pitch").doc(pitchId).get();
      if (docSnapshot.exists) {
        Pitch pitch = Pitch.fromFirestore(docSnapshot);
        emit(pitch);
      } else {
        emit(null);
      }
    } catch (e) {
      print(e);
    }
  }

}