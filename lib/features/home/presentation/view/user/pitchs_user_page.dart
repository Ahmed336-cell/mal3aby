import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/data/profile.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_list_view_user.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/pitch_type_label_list_view.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/search_container.dart';

import '../../../../../constants.dart';

class PitchesUserPage extends StatefulWidget {
  const PitchesUserPage({
    super.key, required this.profile,
  });
  final Profile profile;
  @override
  State<PitchesUserPage> createState() => _PitchesUserPageState();
}

class _PitchesUserPageState extends State<PitchesUserPage> {
  String selectedLabel = "Football";
  String selectedGovernment = ""; // State to hold the selected government filter

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,
        Column(
          children: [
            PitchTypeLabelListView(
              onLabelSelected: (label) {
                setState(() {
                  selectedLabel = label; // Update selected label
                });
              },
            ),
            SearchContainer(
              onSearch: (query) {},
              onFilter: (government) {
                setState(() {
                  selectedGovernment =
                      government; // Update selected government filter
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: PitchListViewUser(
              selectedLabel: selectedLabel,
              selectedGovernment: selectedGovernment,
                  profile: widget.profile,
            ))
          ],
        )
      ],
    );
  }
}
