import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/reservation_list_view_item_user.dart';

import '../../../data/reservations.dart'; // Import your Reservation model

class ReservationListView extends StatefulWidget {
  const ReservationListView({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ReservationListView> createState() => _ReservationListViewState();
}

class _ReservationListViewState extends State<ReservationListView> {
  List<Reservation> reservations = [];

  @override
  void initState() {
    super.initState();
    fetchReservations();
  }

  Future<void> fetchReservations() async {
    try {
      // Access Firestore collection 'reservations' for the specific user
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(widget.id)
          .collection("reservations")
          .get();

      List<Reservation> fetchedReservations = [];

      querySnapshot.docs.forEach((doc) {
        // Extract data from each document
        String dateTime = doc['date'];
        String endTime = doc['endTime'];
        String ownerId = doc['ownerId'];
        String paymentStatus = doc['paymentStatus'];
        String pitchId = doc['pitchId'];
        String pitchName = doc['pitchName'];
        String pitchType = doc['pitchTyoe'];
        String startTime = doc['startTime'];
        String userId = doc['userId'];
        String userName = doc['userName'];
        String phoneOwner=doc['phoneOwner'];
        String phoneUser  =doc['phoneUser'];

        // Create a Reservation object and add it to the list
        Reservation reservation = Reservation(
          date: dateTime,
          endTime: endTime,
          ownerId: ownerId,
          paymentStatus: paymentStatus,
          pitchId: pitchId,
          pitchName: pitchName,
          pitchType: pitchType,
          startTime: startTime,
          userId: userId,
          userName: userName,
          phoneOwner: phoneOwner,
          phoneUser: phoneUser

        );

        fetchedReservations.add(reservation);
      });

      setState(() {
        reservations = fetchedReservations;
      });
    } catch (e) {
      print('Error fetching reservations: $e');
      // Handle errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        Reservation reservation = reservations[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: ReservationListViewItemUser(reservation: reservation),
        );
      },
    );
  }
}
