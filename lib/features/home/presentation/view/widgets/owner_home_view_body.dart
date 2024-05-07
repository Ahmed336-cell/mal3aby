import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/owner/reservations_page.dart';

import '../owner/pitches_page.dart';
class OwnerHomeViewBody extends StatelessWidget {
  const OwnerHomeViewBody({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return  TabBarView(
      children: [
        const PitchesViewPage(),
        ReservationViewPage(id: id,)

      ],

    );
  }
}
