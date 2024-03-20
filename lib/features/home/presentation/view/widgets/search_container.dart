import 'package:flutter/material.dart';

import '../../../../../core/common/custom_text_feild.dart';
class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black,
        child: const Row(
          children: [
            Expanded(child: CustomTextFeild(hint: 'Search', secure: false, icon: Icon(Icons.search), type: TextInputType.text,)),
            SizedBox(width: 8,),
            Icon(Icons.filter_list , size: 28,)
          ],
        )
    );
  }
}
