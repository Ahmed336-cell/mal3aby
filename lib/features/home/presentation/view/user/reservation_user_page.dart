import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/reservation_list_view_user.dart';

import '../../../../../constants.dart';

class ReservationUserPage extends StatelessWidget {
  const ReservationUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,

        const Column(
          children: [
            Expanded(child: ReservationListViewUser())
          ],
        )
      ],
    );
  }
}
