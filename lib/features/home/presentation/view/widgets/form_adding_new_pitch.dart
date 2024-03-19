import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/custom_button.dart';
import '../../../../../core/common/custom_text_feild.dart';
import '../../../../auth/signup/presentation/view/widgets/custom_drop_down_list.dart';


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class FormAddingNewPitch extends StatefulWidget {
  const FormAddingNewPitch({super.key});

  @override
  State<FormAddingNewPitch> createState() => _FormAddingNewPitchState();
}

class _FormAddingNewPitchState extends State<FormAddingNewPitch> {

  String name='';
  String phoneNumber='';
  String confirmPassword='';
  String dropdownValue = '';


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
                        key: _formKey,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("Add Pitch" , style: TextStyle(color: Colors.white , fontSize: 24 , fontWeight: FontWeight.bold),),
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "Pitch Name",secure: false,icon: const Icon(Icons.golf_course_rounded),
                              type: TextInputType.name,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "pitch name is required";
                                }else{
                                  name=value;
                                  return null;
                                }
                              },

                            ),
                            const SizedBox(height: 10,),

                            DropDownButtonAuth(list: const ["Giza","Cairo" , "Alexandria"],
                              onChanged: (value){
                                dropdownValue=value;
                              },
                              icon: const Icon(Icons.location_on),
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "address",secure: false,icon: const Icon(Icons.location_city),
                              type: TextInputType.name,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "address is required";
                                }else{
                                  name=value;
                                  return null;
                                }
                              },

                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "link of google map location",
                              secure: false,icon: const Icon(Icons.map_outlined), type: TextInputType.phone,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "link is required";
                                }else{
                                  phoneNumber=value;
                                  return null;
                                }
                              },


                            ),
                            const SizedBox(height: 10,),
                            DropDownButtonAuth(list: const ["Football","Paddle" , "Tennis" , "Ping Pong" , "Squash" ],
                              onChanged: (value){
                                dropdownValue=value;
                              },
                              icon: const Icon(Icons.sports_baseball_rounded),
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "Price",secure: false,icon: const Icon(Icons.attach_money_rounded),
                              type: TextInputType.text,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "Price is required";
                                }else{
                                  confirmPassword=value;
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16,),

                            CustomButton(status:"Add" , onPressed: (){

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