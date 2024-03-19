import 'package:flutter/material.dart';

import 'core/utils/app_router.dart';

void main() {
  runApp(const Mal3abyApp());
}

class Mal3abyApp extends StatelessWidget {
  const Mal3abyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black54
      ),
    );
  }
}

