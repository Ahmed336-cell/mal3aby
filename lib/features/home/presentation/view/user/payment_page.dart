import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:mal3aby/core/utils/firebase_fuctions.dart';
import 'package:mal3aby/features/auth/data/profile.dart';
import 'package:mal3aby/features/home/data/pitch.dart';
import 'package:mal3aby/features/home/presentation/view/owner/owner_home_page.dart';
import 'package:mal3aby/features/home/presentation/view/user/user_home_page.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/custom_button.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.profile, required this.pitch, required this.selectDate, required this.startTime, required this.endTime});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
  final Profile profile;
  final Pitch pitch;
  final DateTime selectDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
}

class _PaymentPageState extends State<PaymentPage> {
  String name = "";
  String expiryDate = "";
  String cardNumber = "";
  String cvv = "";
  bool isCvvFocused=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.7),

      body: Stack(
        children: [

          Constant.backgorundContainer,
          Constant.colorBackgroundContainer,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardWidget(
                    isHolderNameVisible: true,
                    cardType: CardType.visa,
                    cardBgColor: Colors.black,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: name,
                    cvvCode: cvv,
                    showBackView: isCvvFocused,
                    onCreditCardWidgetChange: (CreditCardBrand) {

                    },
                  ),
                  const SizedBox(height: 16,),
                  FormBuilder(
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          keyboardType: TextInputType.number,
                          name: 'cardNumber',
                          style: const TextStyle(color: Colors.black , backgroundColor: Colors.white),
                          decoration: Constant.paymentDecoration.copyWith(
                              hintText: "Card Number",
                          ),
                          onChanged: (value) {
                            setState(() {
                              cardNumber = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 12,),
                        FormBuilderTextField(
                          keyboardType: TextInputType.number,

                          name: 'expiryDate',
                          style: const TextStyle(color: Colors.black , backgroundColor: Colors.white),

                          decoration: Constant.paymentDecoration.copyWith(hintText: "Expiry Date"
                          ),
                          onChanged: (value) {
                            setState(() {
                              expiryDate = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 8,),
                        FormBuilderTextField(
                          keyboardType: TextInputType.text,

                          name: 'cardHolderName',
                          style: const TextStyle(color: Colors.black , backgroundColor: Colors.white),

                          decoration:Constant.paymentDecoration.copyWith(
                            hintText: "Card Holder Name"

                          ),
                          onChanged: (value) {
                            setState(() {
                              name = value!;
                            });
                          },
                        ),

                        const SizedBox(height: 8,),
                        FormBuilderTextField(
                          keyboardType: TextInputType.number,

                          name: 'cvvCode',
                          style: const TextStyle(color: Colors.black , backgroundColor: Colors.white),

                          decoration:Constant.paymentDecoration.copyWith(
                            hintText: "CVV",
                          ),
                          onChanged: (value){
                            cvv = value!;
                          },
                          onTap: (){
                            setState(() {
                              isCvvFocused= true;

                            });
                          },
                          onEditingComplete: (){
                            setState(() {
                              isCvvFocused= false;

                            });
                          },

                        ),
                        const SizedBox(height: 16),
                        CustomButton(status: "Submit Payment", onPressed: (){
                          if(cardNumber.isNotEmpty && expiryDate.isNotEmpty && name.isNotEmpty && cvv.isNotEmpty){
                            AwesomeDialog(context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.scale,
                              title: "Confirm Payment",
                              desc: "Are you sure want to confirm payment",
                              btnOkOnPress: (){
                              FirebaseFunctions.addReservationToFirestore(profile: widget.profile , pitch: widget.pitch, paymentStatues: "online", date: widget.selectDate, startTime: widget.startTime, endTime: widget.endTime);
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return const UserHomePage();
                              }));
                              },
                              btnCancelOnPress: (){},
                            ).show();
                          }else{
                            AwesomeDialog(context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.scale,
                              title: "Fill Data",
                              desc: "Please fill payment data",
                              btnCancelOnPress: (){},
                            ).show();
                          }

                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}