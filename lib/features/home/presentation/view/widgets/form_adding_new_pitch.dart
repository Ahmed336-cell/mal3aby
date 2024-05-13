import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mal3aby/core/utils/firebase_fuctions.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/custom_button.dart';
import '../../../../../core/common/custom_text_feild.dart';
import '../../../../auth/signup/presentation/view/widgets/custom_drop_down_list.dart';
import '../../manager/image_picker.dart';
import '../owner/owner_home_page.dart';


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class FormAddingNewPitch extends StatefulWidget {
  const FormAddingNewPitch({super.key});

  @override
  State<FormAddingNewPitch> createState() => _FormAddingNewPitchState();
}

class _FormAddingNewPitchState extends State<FormAddingNewPitch> {

  String name='';
  String type='';
  String price='';
  String dropdownValue = '';
  String address="";
  String link="";
  String ownerName="";
  String phone="";
  String ownerId=FirebaseAuth.instance.currentUser!.uid;
  List<String> images = [];
  List<String>links=[];
  bool _uploading = false;

  void _selectImages() async {
    List<String> selectedImages = await ImagePickerService.pickImages();
    if (selectedImages != null) {
      setState(() {
        images.addAll(selectedImages);
      });
    }
  }

  void addPitc(){
    if (_formKey.currentState!.validate()) {
      try{
        FirebaseFunctions.addPitchToFirestore(mapLink: link,pitchName: name, govern: dropdownValue, address: address, userId: ownerId, pitchType: type, price: price,images: links, phoneNumber: phone,ownerName: ownerName);
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return OwnerHomePage(id:ownerId);
        }));
      }catch(e){
        print(e);
      }
      }else{
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: "Fill Data",
        desc: "Data is empty or something wrong",
        btnCancelOnPress: () {},
      ).show();
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

                            CustomTextFeild(
                              hint: "Owner Name",secure: false,icon: const Icon(Icons.person),
                              type: TextInputType.name,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "Owner name is required";
                                }else{
                                  ownerName=value;
                                  return null;
                                }
                              },

                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "PhoneNumber ",secure: false,icon: const Icon(Icons.phone),
                              type: TextInputType.phone,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "Phone number  is required";
                                }else{
                                  phone=value;
                                  return null;
                                }
                              },

                            ),
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
                                  address=value;
                                  return null;
                                }
                              },

                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "link of google map location",
                              secure: false,icon: const Icon(Icons.map_outlined), type: TextInputType.url,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "link is required";
                                }else{
                                  link=value;
                                  return null;
                                }
                              },


                            ),
                            const SizedBox(height: 10,),
                            DropDownButtonAuth(list: const ["Football","Paddle" , "Tennis" , "Ping Pong" , "Squash" ],
                              onChanged: (value){
                                type=value;
                              },
                              icon: const Icon(Icons.sports_baseball_rounded),
                            ),
                            const SizedBox(height: 10,),
                            CustomTextFeild(
                              hint: "Price",secure: false,icon: const Icon(Icons.attach_money_rounded),
                              type: TextInputType.number,
                              validator: (value){
                                if(value==null||value.isEmpty){
                                  return "Price is required";
                                }else{
                                  price=value;
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16,),
                            const Text("Select images for your pitch" , style: TextStyle(color: Colors.white,
                            fontSize: 20
                            ),),
                            IconButton(onPressed: (){
                              _selectImages();
                            }, icon: const Icon(
                              Icons.image,size: 80,
                              color: Colors.white,
                            )),

                            CustomButton(status: _uploading ? 'Uploading...' : 'Upload', onPressed: () async{
                              setState(() {
                                _uploading = true;
                              });
                            links= await FirebaseFunctions.uploadImages(images,ownerId);
                              setState(() {
                                images.clear();
                                _uploading = false;
                              });
                            },

                            ),
                            if (_uploading) const LinearProgressIndicator(),
                            const SizedBox(height: 8,),
                            CustomButton(visible: links.isNotEmpty,status:"Add" , onPressed: (){
                              if(links.isNotEmpty){
                                addPitc();

                              }else{
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  title: "Uploading",
                                  desc: "Images still uploading or you didn't choose images",
                                  btnCancelOnPress: () {},
                                ).show();

                              }
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