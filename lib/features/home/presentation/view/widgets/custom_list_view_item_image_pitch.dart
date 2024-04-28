import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItemImagePitch extends StatelessWidget {
  const CustomListViewItemImagePitch({super.key, required this.link});
  final String link;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 4 / 4,
          // child:Image.asset(AssetsData.background , fit: BoxFit.cover,)
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: link,
            errorWidget: (context, url, error) =>
            const Icon(Icons.error, color: Colors.red,),
          )

      ),
    );

  }
}
