import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../widgets/reservation_list_view.dart';

class ReservationViewPage extends StatelessWidget {
  const ReservationViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,

        const Column(
          children: [
            Expanded(child: ReservationListView())
          ],
        )
      ],
    );
  }
}
