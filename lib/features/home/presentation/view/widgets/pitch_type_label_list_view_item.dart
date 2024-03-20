import 'package:flutter/material.dart';
class PitchTypeLabelListViewItem extends StatelessWidget {
  const PitchTypeLabelListViewItem({super.key, required this.label});
 final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          color: Colors.black,
          width: 1,

        ),
        borderRadius: const BorderRadius.all(Radius.circular(16))
      ),
      child:  Text(label ,style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.black), ),
    );
  }
}
