import 'package:flutter/material.dart';
import 'package:mal3aby/features/auth/login/presentation/view/widgets/login_view_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: LoginViewBody(),
    ));
  }
}
