import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.status,  required this.onPressed});
  final String status;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        //padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.green,
      ),
      child:  Text(
        status,
        style: const TextStyle(fontSize: 20,color: Colors.white),
      ),
    );
  }
}