import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/reservations_list_view_item_owner.dart';

import '../../../../../constants.dart';
import '../widgets/reservation_list_view.dart';

class ReservationViewPage extends StatelessWidget {
  const ReservationViewPage({super.key, required this.id});
 final String id;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,

         Column(
          children: [
            Expanded(child: ReservationListViewItemowenr(id: id,))
          ],
        )
      ],
    );
  }
}
