import 'package:flutter/material.dart';

import 'input_feild.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue, // Example background color
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),

        ),

        Container(
          color: Colors.black.withOpacity(0.7),
        ),

         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8 , vertical: 16),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     ),
                     InputFeilds(),
                   
                  ],
                ),
              ),

            ],
          ),
        ),

      ]


    );
  }
}
