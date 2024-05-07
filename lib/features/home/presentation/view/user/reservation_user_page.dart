import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../widgets/reservation_list_view.dart';

class ReservationUserPage extends StatelessWidget {
  const ReservationUserPage({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,

         Column(
          children: [
            Expanded(child: ReservationListView(id: id,))
          ],
        )
      ],
    );
  }
}
