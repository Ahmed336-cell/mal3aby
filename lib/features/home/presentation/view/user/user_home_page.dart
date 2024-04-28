import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3aby/features/home/presentation/manager/user_data_fetch_cubit.dart';
import 'package:mal3aby/features/home/presentation/view/widgets/user_home_page_view_body.dart';

import '../../../../auth/data/profile.dart';
class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<UserDataFetchCubit, Profile?>(
        builder: (context, profile) {
          if (profile == null) {
            // Profile is not yet loaded, show a loading indicator or handle appropriately
            return const Center(child: CircularProgressIndicator());
          } else {
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Welcome ${profile.name ?? 'User'}", // Use default value if profile.name is null
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  automaticallyImplyLeading: false, // Remove the back button
                  backgroundColor: Colors.black,
                  bottom: const TabBar(
                    labelColor: Colors.white,
                    indicatorColor: Colors.green,
                    dividerColor: Colors.white,
                    tabs: [
                      Tab(text: "Pitches Page"),
                      Tab(text: "Reservations page"),
                    ],
                  ),
                ),
                body: UserHomeViewBody(profile: profile),
              ),
            );
          }
        },
      ),
    );
  }
}
