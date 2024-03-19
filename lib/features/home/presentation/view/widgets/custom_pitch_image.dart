import 'package:flutter/material.dart';
import 'package:mal3aby/core/utils/assets.dart';

class CustomPitchImage extends StatelessWidget {
  const CustomPitchImage({super.key});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 4 / 4,
          child:Image.asset(AssetsData.background , fit: BoxFit.cover,)
          // CachedNetworkImage(
          //   fit: BoxFit.fill,
          //   imageUrl: ,
          //   errorWidget:(context,url,error)=> const Icon(Icons.error , color: Colors.red,),
          // )

      ),
    );
  }
}
