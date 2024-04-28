
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/features/home/data/pitch.dart';
import 'package:mal3aby/features/home/presentation/manager/data_fetch_cubit.dart';
import 'package:mal3aby/features/home/presentation/view/owner/owner_pitch_details_page.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/custom_pitch_image.dart';
class PitchListViewItem extends StatelessWidget {
  const PitchListViewItem({super.key, required this.pitch});
  final Pitch? pitch;
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: () {
        context.read<DataFetchingCubit>().fetchDataPitch(pitch!.OwnerId!,pitch!.pitchId!);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerPitchDetailsPage(pitch: pitch!)));
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
                       pitch!.pitchName!,
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
                         pitch!.pitchGovernement!,
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
                          pitch!.price!,

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
