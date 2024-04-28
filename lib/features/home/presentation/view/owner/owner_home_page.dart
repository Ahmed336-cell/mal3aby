import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mal3aby/core/utils/app_router.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/owner_home_view_body.dart';

class OwnerHomePage extends StatelessWidget {
  const OwnerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        child: DefaultTabController(
          length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome Owner", style: TextStyle(fontSize: 30,
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
        body: const OwnerHomeViewBody(),
        floatingActionButton: FloatingActionButton(onPressed: () {
          GoRouter.of(context).push(AppRouter.KAddingPitchPage);
        },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add ,size: 30,),
        ),
      ),
    ));
  }
}
