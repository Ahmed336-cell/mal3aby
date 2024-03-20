import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_list_view_item_user.dart';
class PitchListViewUser extends StatelessWidget {
  const PitchListViewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
            child: PitchUserListViewItem(),
          );
        });
  }
}