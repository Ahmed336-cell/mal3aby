import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_list_view_user.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_type_label_list_view.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/search_container.dart';

import '../../../../../constants.dart';

class PitchesUserPage extends StatelessWidget {
  const PitchesUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,
        const Column(
          children: [
            PitchTypeLabelListView(),

          SearchContainer(),
            SizedBox(height: 8,),
            Expanded(child: PitchListViewUser())
          ],
        )

      ],
    );
  }
}
