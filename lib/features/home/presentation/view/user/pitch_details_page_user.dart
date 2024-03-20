import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/UserPitchDetailsViewBody.dart';
class PitchDetailsPageUser extends StatelessWidget {
  const PitchDetailsPageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: UserPitchDetailsViewBody(),
    ));
    }
}
