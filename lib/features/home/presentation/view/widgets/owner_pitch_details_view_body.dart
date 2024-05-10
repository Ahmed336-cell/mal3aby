import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/core/common/custom_button.dart';
import 'package:mal3aby/features/home/data/pitch.dart';
import 'package:mal3aby/features/home/presentation/manager/data_fetch_cubit.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_images_list_view.dart';

import '../../../../../constants.dart';

class OwnerPitchDetailsViewBody extends StatelessWidget {
  const OwnerPitchDetailsViewBody({super.key, required this.pitch});
  final  Pitch pitch;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,
       BlocBuilder<DataFetchingCubit,Pitch?>(
        builder: (context,pitch){
          if(pitch!=null){
            print("images ${pitch.imageList!.length}");
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                     PitchImageListView(pitch: pitch,),
                      const SizedBox(height: 16,),
                       Text(pitch.pitchName!,style: const TextStyle(fontSize: 34 , fontWeight: FontWeight.bold),),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(width: 8,),
                          Text("${pitch.pitchGovernement!} ", style: const TextStyle(fontSize: 24),)
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
                          Text(pitch.phoneNumber != null?pitch.phoneNumber!:"", style: TextStyle(fontSize: 24),)
                        ],
                      ),
                      const SizedBox(height: 8,),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 8,),
                          Text(pitch.ownerName!=null?pitch.ownerName!:"", style: TextStyle(fontSize: 24),)
                        ],
                      ),
                      const SizedBox(height: 8,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.attach_money_outlined),
                          const SizedBox(width: 8,),
                          Text("${pitch.price!} Egp per hour", style: const TextStyle(fontSize: 24),)
                        ],
                      ),

                      const SizedBox(height: 16,),

                    ],
                  ),
                )
              ],
            );
          }else{
            return const Center(child: Text("No Data"));
          }
        }

       )
      ],

    );
  }
}
