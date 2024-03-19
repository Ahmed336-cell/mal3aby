import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/owner_pitch_details_view_body.dart';
class OwnerPitchDetailsPage extends StatelessWidget {
  const OwnerPitchDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: OwnerPitchDetailsViewBody(),
    ));
  }
}
