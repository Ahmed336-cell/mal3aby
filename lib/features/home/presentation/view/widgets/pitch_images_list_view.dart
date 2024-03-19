import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/custom_pitch_image.dart';

class PitchImageListView extends StatelessWidget {
  const PitchImageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context,index){
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomPitchImage(),
          );
          }),
    );
  }
}
