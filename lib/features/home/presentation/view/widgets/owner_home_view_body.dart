import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/owner/reservations_page.dart';

import '../owner/pitches_page.dart';
class OwnerHomeViewBody extends StatelessWidget {
  const OwnerHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        PitchesViewPage(),
        ReservationViewPage()

      ],

    );
  }
}
