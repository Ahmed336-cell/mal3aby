import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_list_view.dart';

import '../../../../../constants.dart';
class PitchesViewPage extends StatelessWidget {
  const PitchesViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0 , vertical: 8),
          child: const Column(

            children: [

             Expanded(child: PitchListView())
            ],
          ),
        )
      ],
    );
  }
}
