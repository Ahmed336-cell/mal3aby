import 'package:flutter/material.dart';
class ReservationListViewUser extends StatelessWidget {
  const ReservationListViewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
            child: Text(""),
          );
        });
  }
}