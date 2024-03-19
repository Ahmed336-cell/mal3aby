import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
      },
      child: const Text("Forgot password?",
        style: TextStyle(color: Colors.white , backgroundColor: Colors.black),
      ),
    );
  }
}