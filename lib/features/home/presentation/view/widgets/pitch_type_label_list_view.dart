import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_type_label_list_view_item.dart';
class PitchTypeLabelListView extends StatelessWidget {
  const PitchTypeLabelListView({super.key});
  @override
  Widget build(BuildContext context) {
    List<String>labels=["Football" , "Tennis" , "Paddle","Squash","Ping Pong"];
    return  SizedBox(
      height: MediaQuery.of(context).size.height * .09,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                  onTap: (){
                  },
                  child:  Center(child: PitchTypeLabelListViewItem(label: labels[index],)),
              )
            );
          }),
    );
  }
}
