import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mal3aby/core/utils/app_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      // Navigate to main screen after 3 seconds
      GoRouter.of(context).pushReplacement(AppRouter.KLoginPage);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to \n Mal3aby App" ,
              textAlign:TextAlign.center,
              style:
              TextStyle(fontSize: 30 , color: Colors.white ,
                  fontWeight: FontWeight.bold,
              ) ,
            ),
            const SizedBox(height: 16,),
            const Text("Will found Different Pitches with different prices" , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
            Center(
              child: Lottie.asset(
                'assets/splashAnim.json', // Replace with your animation file path
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
