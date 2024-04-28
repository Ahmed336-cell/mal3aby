import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/owner_pitch_details_view_body.dart';

import '../../../data/pitch.dart';
class OwnerPitchDetailsPage extends StatelessWidget {
  const OwnerPitchDetailsPage({super.key, required this.pitch});
final Pitch pitch;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: OwnerPitchDetailsViewBody(pitch: pitch,),
    ));
  }
}
