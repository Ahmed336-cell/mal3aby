import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mal3aby/core/utils/app_router.dart';
import 'package:mal3aby/features/auth/login/presentation/view/widgets/login_view_body.dart';
import 'package:mal3aby/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:mal3aby/features/home/presentation/manager/user_data_fetch_cubit.dart';

import '../../../../home/presentation/manager/pitchs_list_cubit.dart';
import '../../../../home/presentation/view/owner/owner_home_page.dart';
import '../../../manager/auth_cubit/auth_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
      body: BlocConsumer<AuthenticationCubit,AuthState>(
        listener:(context,state){
          if(state is  AuthenticationSuccessOwner){
            context.read<DataFetchingPitchsCubit>().fetchListOfPitchesOwnerData(state.user!.uid);
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return OwnerHomePage(id: state.user!.uid!);
            }));
          }else if(state is AuthenticationSuccessUser){
            context.read<UserDataFetchCubit>().fetchUserData(state.user!.uid);
            context.read<DataFetchingPitchsCubit>().fetchListOfPitchesUserData();
            GoRouter.of(context).push(AppRouter.KUserHome);
            print(state.user!.uid);

          }else if (state is AuthenticationFailure) {
            // Show error dialog for authentication failure
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title:  Text(state.error),
                  content: const Text("Invalid email or password"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Try again"),
                    ),
                  ],
                );
              },
            );
          }
    },
        builder: (BuildContext context, AuthState state){
          if(state is AuthenticationLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return const LoginViewBody();
          }
        },
      )


    ));
  }
}
