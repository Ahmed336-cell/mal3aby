import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/login/presentation/view/widgets/forget_password.dart';
import 'package:mal3aby/features/auth/login/presentation/view/widgets/signup_button.dart';

import 'login_form_input.dart';

class InputFeilds extends StatelessWidget {
  const InputFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          FormInput(),
          ForgetPassword(),
          SignUp()
        ],
      ),
    );
  }
}
