import 'package:flutter/material.dart';

import 'core/utils/assets.dart';
class Constant{

  static  InputDecoration paymentDecoration=  InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,

      ),

      fillColor: Colors.black,
      filled: true,
      hintStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
      )

  );
  static bool isValidEmail(String email) {
    // Regular expression for validating an email address
    // This pattern checks for the basic structure of an email address
    // It may not catch all possible invalid emails, but it covers most cases
    // You can use more sophisticated regex patterns for stricter validation
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static Widget backgorundContainer =  Container(
    decoration: const BoxDecoration(
      color: Colors.blue, // Example background color
      image: DecorationImage(
        image: AssetImage(AssetsData.background),
        fit: BoxFit.cover,
      ),
    ),

  );

  static Widget colorBackgroundContainer= Container(
    color: Colors.black.withOpacity(0.7),
  );

}