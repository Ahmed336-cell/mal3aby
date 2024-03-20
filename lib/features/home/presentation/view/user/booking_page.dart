import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/booking_view_body.dart';


class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(child: Scaffold(
      body: BookingViewBody(),
    ));
  }
}
