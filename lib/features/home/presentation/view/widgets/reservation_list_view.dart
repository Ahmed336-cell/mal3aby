import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/reservation_list_view_item.dart';

class ReservationListView extends StatelessWidget {
  const ReservationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
            child: ReservationListViewItem(),
          );
        });
  }
}

