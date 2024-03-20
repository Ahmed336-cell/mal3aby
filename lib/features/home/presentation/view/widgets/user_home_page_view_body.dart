import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/user/pitchs_user_page.dart';

import '../owner/reservations_page.dart';
class UserHomeViewBody extends StatelessWidget {
  const UserHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TabBarView(
      children: [
        PitchesUserPage(),
        ReservationViewPage()

      ],

    );
  }
}
