import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/data/profile.dart';
import 'package:mal3aby/features/home/presentation/view/user/pitchs_user_page.dart';
import 'package:mal3aby/features/home/presentation/view/user/reservation_user_page.dart';

import '../owner/reservations_page.dart';
class UserHomeViewBody extends StatelessWidget {
  const UserHomeViewBody({super.key, required this.profile});
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return    TabBarView(
      children: [
        PitchesUserPage(profile: profile,),
         ReservationUserPage(id: profile.profileId!,)

      ],

    );
  }
}
