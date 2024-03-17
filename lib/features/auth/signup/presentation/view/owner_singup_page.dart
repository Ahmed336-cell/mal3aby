import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/signup/presentation/view/widgets/form_signup_owner.dart';

class SignUpOwnerPage extends StatelessWidget {
  const SignUpOwnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: FormInputSignupOwner(),
      ),
    );
  }
}
