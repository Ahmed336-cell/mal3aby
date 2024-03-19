import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mal3aby/features/auth/signup/presentation/view/widgets/custom_drop_down_list.dart';

import '../../../../../../core/utils/app_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/common/custom_button.dart';


class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = '';
    return Scaffold(

      body:Stack(
        children: [
          Constant.backgorundContainer,
          Constant.colorBackgroundContainer,

         Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.transparent,
                  child:  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text("Select user or Owner" , style: TextStyle(color: Colors.white , fontSize: 24 , fontWeight: FontWeight.bold),),
                      ),
                      const SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropDownButtonAuth(list: const ["User","Owner"],
                          onChanged: (value){
                            dropdownValue=value;
                          },
                          icon: const Icon(Icons.person),
                        ),

                      ),
                      const SizedBox(height: 16,),

                      CustomButton(status: "Continue",onPressed: (){
                        if ( dropdownValue== 'User') {
                          GoRouter.of(context).pushReplacement(AppRouter.KSignUpUser);
                        } else if (dropdownValue == 'Owner') {
                          GoRouter.of(context).pushReplacement(AppRouter.KSignUpOwner);
                        }
                      },),
                      const SizedBox(height: 16,),

                    ],
                  ),
                )

              ],
            ),
          ),
        ),
    ]
      ),
    );
  }
}