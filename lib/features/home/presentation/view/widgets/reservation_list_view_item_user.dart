import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/data/reservations.dart';
import 'package:sks_ticket_view/sks_ticket_view.dart';

class ReservationListViewItemUser extends StatelessWidget {
  const ReservationListViewItemUser({super.key, required this.reservation});
  final Reservation reservation;
  @override
  Widget build(BuildContext context) {
    return  SKSTicketView(
      backgroundPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
      drawArc: true,
      triangleAxis: Axis.vertical,
      borderRadius: 1,
      drawDivider: true,
      child:Container(
        color: Colors.transparent,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 180,
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child:  Text(
                          "Name: ${reservation.userName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 17,color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                       Text(
                        "pitch name : ${reservation.pitchName}",
                        maxLines: 1,
                        style: const TextStyle(fontSize: 16,color: Colors.black , fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                       Text(
                        "pitch type : ${reservation.pitchType}",
                        style: const TextStyle(fontSize: 16,color: Colors.black , fontWeight: FontWeight.w500),

                      ),
                      const SizedBox(
                        height: 3,
                      ),
                       Text(
                        "Date : ${reservation.date}",
                        style: const TextStyle(fontSize: 16,color: Colors.black , fontWeight: FontWeight.w500),

                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Time : from ${reservation.startTime} pm to ${reservation.endTime} pm",
                        style: const TextStyle(fontSize: 16,color: Colors.black , fontWeight: FontWeight.w500),

                      ),
                      const SizedBox(
                        height: 3,
                      ),
                       Row(
                        children: [
                          const Icon(Icons.phone,color: Colors.black,),
                          const SizedBox(width: 6,),
                          Text(reservation.phoneOwner , style: const TextStyle(fontSize: 18,color: Colors.black),)
                        ],

                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}