import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mal3aby/features/auth/signup/presentation/view/widgets/form_signup_owner.dart';
import 'package:mal3aby/features/home/presentation/manager/pitchs_list_cubit.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../manager/auth_cubit/auth_cubit.dart';
import '../../../manager/auth_cubit/auth_state.dart';

class SignUpOwnerPage extends StatelessWidget {
  const SignUpOwnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthenticationCubit,AuthState>(
          listener: (context,state){
            if(state is AuthenticationSuccess){
              context.read<DataFetchingPitchsCubit>().fetchListOfPitchesOwnerData(state.user!.uid);

              GoRouter.of(context).pushReplacement(AppRouter.KOwnerHomePage);

            }else if(state is AuthenticationFailure){
              Future.delayed(Duration.zero,(){
                AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    title: "Login failed",
                    desc: "Check data please",
                    btnCancelOnPress: (){

                    }
                ).show();
              });


            }
          }, builder: (BuildContext context, AuthState state) {
          if(state is AuthenticationLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return const FormInputSignupOwner();
          }
        },
        ),
      )
    );
  }
}