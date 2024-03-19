import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal3aby/core/common/custom_button.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_images_list_view.dart';

import '../../../../../constants.dart';

class OwnerPitchDetailsViewBody extends StatelessWidget {
  const OwnerPitchDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,
       CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const PitchImageListView(),
                const SizedBox(height: 16,),
                const Text("Barcelona",style: TextStyle(fontSize: 34 , fontWeight: FontWeight.bold),),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.location_on),
                    SizedBox(width: 8,),
                    Text("Giza", style: TextStyle(fontSize: 24),)
                ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_city),
                    SizedBox(width: 8,),
                    Text("el hosary , 6 october", style: TextStyle(fontSize: 24),)
                  ],
                ),
                const SizedBox(height: 8,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 8,),
                    Text("0123456789", style: TextStyle(fontSize: 24),)
                  ],
                ),
                const SizedBox(height: 8,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 8,),
                    Text("Ahmed Maher", style: TextStyle(fontSize: 24),)
                  ],
                ),
                const SizedBox(height: 8,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money_outlined),
                    SizedBox(width: 8,),
                    Text("250 Egp per hour", style: TextStyle(fontSize: 24),)
                  ],
                ),

                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    CustomButton(status:"Edit" , onPressed: (){}),

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
