import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/data/pitch.dart';

class CustomPitchImage extends StatelessWidget {
  const CustomPitchImage({super.key, required this.pitch});
 final Pitch? pitch;
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 4 / 4,
          // child:Image.asset(AssetsData.background , fit: BoxFit.cover,)
          child:CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl:pitch!.imageList!.first,
            errorWidget:(context,url,error)=> const Icon(Icons.error , color: Colors.red,),
          )

      ),
    );
  }
}
