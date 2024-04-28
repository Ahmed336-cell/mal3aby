import 'package:flutter/material.dart';

import '../../../data/pitch.dart';
import 'custom_list_view_item_image_pitch.dart';

class PitchImageListView extends StatelessWidget {
  const PitchImageListView({super.key, required this.pitch});
  final Pitch pitch;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: pitch.imageList?.length,
          itemBuilder: (context,index){
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomListViewItemImagePitch(link: pitch.imageList![index],),
          );
          }),
    );
  }
}
