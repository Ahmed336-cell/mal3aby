import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/custom_button.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
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
                          name: 'cardNumber',
                          style: const TextStyle(color: Colors.black ,),
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
                          name: 'expiryDate',
                          style: const TextStyle(color: Colors.black ,),

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
                          name: 'cardHolderName',
                          style: const TextStyle(color: Colors.black ,),

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
                          name: 'cvvCode',
                          style: const TextStyle(color: Colors.black ,),

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