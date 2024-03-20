import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mal3aby/core/utils/app_router.dart';

import 'custom_pitch_image.dart';
class PitchUserListViewItem extends StatelessWidget {
  const PitchUserListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.KUserPitchDetailsPage);
      },
      child: Container(
        color: Colors.black,

        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              const CustomPitchImage(),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: const Text(
                        "Barcelona Pitch",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 8,),
                        Text(
                          "Giza , Hawamdia",
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Row(

                      children: [
                        Icon(Icons.attach_money_sharp),
                        SizedBox(width: 8,),
                        Text(
                          "250 EGP",

                        ),

                      ],
                    ),
                    const Row(

                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 8,),
                        Text(
                          "Mohamed Ahmed",

                        ),

                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
