import 'package:flutter/material.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/user_home_page_view_body.dart';
class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Welcome Mohamed", style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,

              ),),
              automaticallyImplyLeading: false, // Remove the back button
              backgroundColor: Colors.black,
              bottom: const TabBar(
                labelColor: Colors.white,
                indicatorColor: Colors.green,
                dividerColor: Colors.white,
                tabs: [
                  Tab(text: "Pitches Page", ),
                  Tab(text: "Reservations page",)
                ],
              ),
            ),
                body: const UserHomeViewBody(),
              ),
        ));
  }
}
