import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/data/profile.dart';
import 'package:mal3aby/features/home/data/pitch.dart';
import 'package:mal3aby/features/home/presentation/view/user/pitch_details_page_user.dart';

import 'custom_pitch_image.dart';
class PitchUserListViewItem extends StatelessWidget {
  const PitchUserListViewItem({super.key, required this.pitch, required this.profile});
  final Pitch pitch;
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return PitchDetailsPageUser(pitch: pitch,profile: profile,);
        }));
      },
      child: Container(
        color: Colors.black,

        child: SizedBox(
          height: 125,
          child: Row(
            children: [
                CustomPitchImage(pitch: pitch,),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child:  Text(
                        pitch.pitchName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                     Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 8,),
                        Text(
                          "${pitch.pitchGovernement} , ${pitch.address}",
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                     Row(

                      children: [
                        const Icon(Icons.attach_money_sharp),
                        const SizedBox(width: 8,),
                        Text(
                         pitch.price!,

                        ),

                      ],
                    ),
                     Row(

                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 8,),
                        Text(
                         pitch.ownerName! ,

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
