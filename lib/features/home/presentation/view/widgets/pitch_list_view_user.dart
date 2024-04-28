import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/features/auth/data/profile.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_list_view_item_user.dart';

import '../../../data/pitch.dart';
import '../../manager/pitchs_list_cubit.dart';

class PitchListViewUser extends StatelessWidget {
  final String selectedLabel;
  final String selectedGovernment;
  final Profile profile;

  const PitchListViewUser({Key? key, required this.selectedLabel, required this.selectedGovernment, required this.profile,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataFetchingPitchsCubit, List<Pitch>>(
      builder: (context, pitch) {
        List<Pitch> filteredPitches = pitch;

        // Filter pitches based on selected label and government
        if (selectedLabel.isNotEmpty) {
          filteredPitches = filteredPitches.where((p) => p.typeOfPitch == selectedLabel).toList();
        }

        if (selectedGovernment.isNotEmpty) {
          filteredPitches = filteredPitches.where((p) => p.pitchGovernement == selectedGovernment).toList();
        }

        if (filteredPitches.isNotEmpty) {
          print(filteredPitches.length);
          return RefreshIndicator(
            onRefresh: () async {
              context.read<DataFetchingPitchsCubit>().fetchListOfPitchesUserData();
            },
            child: ListView.builder(
              itemCount: filteredPitches.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: PitchUserListViewItem(pitch: filteredPitches[index],profile: profile,),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text(
              "No Pitches to appear",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }
}
