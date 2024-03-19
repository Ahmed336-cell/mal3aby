import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/user_home_page_view_body.dart';
class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: UserHomeViewBody(),
    ));
  }
}
