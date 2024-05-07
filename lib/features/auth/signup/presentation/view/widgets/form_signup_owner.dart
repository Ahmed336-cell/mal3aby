import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/common/custom_button.dart';
import '../../../../../../core/common/custom_text_feild.dart';
import '../../../../manager/auth_cubit/auth_cubit.dart';
import '../../../../../../core/utils/firebase_fuctions.dart';


final GlobalKey<FormState> _formKeysignup = GlobalKey<FormState>();

class FormInputSignupOwner extends StatefulWidget {
  const FormInputSignupOwner({super.key});

  @override
  State<FormInputSignupOwner> createState() => _FormInputSignupOwnerState();
}

class _FormInputSignupOwnerState extends State<FormInputSignupOwner> {

  String email = '';
  String password = '';
  String name='';
  String phoneNumber='';
  String confirmPassword='';
  void navigate(BuildContext context){
    _signUp(context);
  }
  void _signUp(BuildContext context) async {
    if (_formKeysignup.currentState!.validate()) {
      if (confirmPassword == password ) {
        try {
          // Create user in Firebase Authentication
          User? user = await context.read<AuthenticationCubit>().signUpWithEmailAndPassword(email, password);

          if (user != null) {
            // Use the user's ID to store additional information in Firestore
            final userId = user.uid;
            FirebaseFunctions.addUserToFirestore(name: name,userId: userId,email: email,phoneNumber: phoneNumber, authType: 'owner', );
          }

        } catch (e) {
          print('Error during signup: $e');
          // Handle signup errors here
        }
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          title: "Wrong password",
          desc: "Password and Confirm password are different",
          btnCancelOnPress: () {},
        ).show();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Constant.backgorundContainer,
          Constant.colorBackgroundContainer,

          Center(
            child: SingleChildScrollView(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.transparent,
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                      child: Form(
                        key: _formKeysignup,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("SignUp" , style: TextStyle(color: Colors.white , fontSize: 24 , fontWeight: FontWeight.bold),),
                            ),
                            CustomTextFeild(
                              hint: "UserName",secure: false,icon: const Icon(Icons.person),
                              type: TextInputType.name,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "user name is required";
                                }else{
                                  name=value;
                                  return null;
                                }
                              },

                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "Phone Number",
                              secure: false,icon: const Icon(Icons.phone), type: TextInputType.phone,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "phone number is required";
                                }else{
                                  phoneNumber=value;
                                  return null;
                                }
                              },


                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "Email",secure: false,icon: const Icon(Icons.email),
                              type: TextInputType.emailAddress,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "Email is required";
                                }else if(!Constant.isValidEmail(value)){
                                  return "Invalid Email";
                                }

                                else{
                                  email=value;
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(hint: "Password",secure: true,icon: const Icon(Icons.password),
                              type: TextInputType.text,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "password is required";
                                }else if(value.length<6){
                                  return "Password must be more than 6 characters";
                                }

                                else{
                                  password=value;
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "Password Confirm",secure: true,icon: const Icon(Icons.password),
                              type: TextInputType.text,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "confirm password is required";
                                }else{
                                  confirmPassword=value;
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16,),

                            CustomButton(status:"Sign Up" , onPressed: (){
                              _signUp(context);

                            }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]
    );
  }
}