import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/data/profile.dart';
import 'package:mal3aby/features/home/data/pitch.dart';
import 'package:mal3aby/features/home/presentation/view/user/booking_page.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_images_list_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/custom_button.dart';
class UserPitchDetailsViewBody extends StatelessWidget {
  const UserPitchDetailsViewBody({super.key, required this.pitch, required this.profile});
  final Pitch pitch;
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                   Center(child: PitchImageListView(pitch: pitch,)),
                  const SizedBox(height: 16,),
                   Text(pitch.pitchName!,style: const TextStyle(fontSize: 34 , fontWeight: FontWeight.bold),),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8,),
                      Text(pitch.pitchGovernement!, style: const TextStyle(fontSize: 24),)
                    ],
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_city),
                      const SizedBox(width: 8,),
                      Text(pitch.address!, style: const TextStyle(fontSize: 24),)
                    ],
                  ),
                  const SizedBox(height: 8,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone),
                      const SizedBox(width: 8,),
                      Text(pitch.phoneNumber!, style: const TextStyle(fontSize: 24),)
                    ],
                  ),
                  const SizedBox(height: 8,),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 8,),
                      Text(pitch.ownerName!, style: const TextStyle(fontSize: 24),)
                    ],
                  ),
                  const SizedBox(height: 8,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.attach_money_outlined),
                      const SizedBox(width: 8,),
                      Text("${pitch.price} Egp per hour", style: const TextStyle(fontSize: 24),)
                    ],
                  ),

                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      CustomButton(status:"Book" , onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return BookingPage(pitch: pitch, profile: profile);
                        }));
                      }),

                      CustomButton(status:"Location" , onPressed: (){})


                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],

    );
  }
}
