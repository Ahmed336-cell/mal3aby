import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/form_adding_new_pitch.dart';

class AddingNewPitchPage extends StatelessWidget {
  const AddingNewPitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: FormAddingNewPitch(),));
  }
}
