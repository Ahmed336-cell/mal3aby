import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/features/home/presentation/manager/pitchs_list_cubit.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_list_view_item.dart';

import '../../../data/pitch.dart';

class PitchListView extends StatefulWidget {
  const PitchListView({super.key});

  @override
  State<PitchListView> createState() => _PitchListViewState();
}

class _PitchListViewState extends State<PitchListView> {
@override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder <DataFetchingPitchsCubit,List<Pitch>>(
      builder:(context, pitch){
        if(pitch.isNotEmpty){
          print(pitch.length);
          return RefreshIndicator(
            onRefresh: ()async{
              context.read<DataFetchingPitchsCubit>().fetchListOfPitchesOwnerData(pitch[0].OwnerId!);

            },
            child: ListView.builder(
                itemCount: pitch.length,
                itemBuilder: (context,index){
                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                    child: PitchListViewItem(pitch: pitch[index],),
                  );
                }),
          );
        }else{
          return RefreshIndicator(
            onRefresh: ()async{
              context.read<DataFetchingPitchsCubit>().fetchListOfPitchesOwnerData(pitch[0].OwnerId!);

            },
            child: const Center(child: Text("No Pitches to appear " , style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),),
          );
        }


      },
    );
  }
}
