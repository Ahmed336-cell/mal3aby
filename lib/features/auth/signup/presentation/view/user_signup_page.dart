import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/signup/presentation/view/widgets/form_signup_user.dart';
class SignUpUserPage extends StatelessWidget {
  const SignUpUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: FormInputSignupUser(),
    ));
  }
}
