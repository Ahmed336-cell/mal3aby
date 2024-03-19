import 'package:flutter/material.dart';
import 'package:sks_ticket_view/sks_ticket_view.dart';


class ReservationListViewItem extends StatelessWidget {
  const ReservationListViewItem({super.key});

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
                        child: const Text(
                          "Name: Ahmed Maher",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 17,color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "pitch name : Barcelona Pitch",
                        maxLines: 1,
                        style: TextStyle(fontSize: 16,color: Colors.black , fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "pitch type : Football",
                        style: TextStyle(fontSize: 16,color: Colors.black , fontWeight: FontWeight.w500),

                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Date : 27/3/2024",
                        style: TextStyle(fontSize: 16,color: Colors.black , fontWeight: FontWeight.w500),

                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Time : from 9 pm to 10 pm",
                        style: TextStyle(fontSize: 16,color: Colors.black , fontWeight: FontWeight.w500),

                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.phone,color: Colors.black,),
                          SizedBox(width: 6,),
                          Text("0112222566" , style: TextStyle(fontSize: 18,color: Colors.black),)
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