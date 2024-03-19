import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_list_view_item.dart';

class PitchListView extends StatelessWidget {
  const PitchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
            child: PitchListViewItem(),
          );
        });
  }
}
