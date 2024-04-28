import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/data/profile.dart';
import 'package:mal3aby/features/home/data/pitch.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/booking_view_body.dart';


class BookingPage extends StatelessWidget {
  const BookingPage({super.key, required this.pitch, required this.profile});
  final Pitch pitch;
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return   SafeArea(child: Scaffold(
      body: BookingViewBody(profile: profile,pitch: pitch,),
    ));
  }
}
