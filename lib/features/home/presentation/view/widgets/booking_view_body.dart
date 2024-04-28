import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mal3aby/core/common/custom_button.dart';
import 'package:mal3aby/core/utils/app_router.dart';
import 'package:mal3aby/core/utils/firebase_fuctions.dart';
import 'package:mal3aby/features/auth/data/profile.dart';
import 'package:mal3aby/features/home/data/pitch.dart';
import 'package:mal3aby/features/home/presentation/view/user/payment_page.dart';

import '../../../../../constants.dart';

class BookingViewBody extends StatefulWidget {
  const BookingViewBody({super.key, required this.pitch, required this.profile});

  @override
  _BookingViewBodyState createState() => _BookingViewBodyState();
  final Pitch pitch;
  final Profile profile;
}

class _BookingViewBodyState extends State<BookingViewBody> {
  late DateTime selectedDate = DateTime.now();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Constant.backgorundContainer,
        Constant.colorBackgroundContainer,
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Book Date And Time" , style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
              const SizedBox(height: 16,),
              CustomButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                status: null == selectedDate
                    ? 'Select Date'
                    : 'Date: ${selectedDate.toString().split(' ')[0]}',
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onPressed: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 8, minute: 0), // Set your desired start time
                      );
                      if (pickedTime != null) {
                        setState(() {
                          startTime = pickedTime;
                        });
                      }
                    },
                    status: startTime == null
                        ? 'Start Time'
                        : 'Start Time: ${startTime!.format(context)}',
                  ),
                  CustomButton(
                    onPressed: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: const TimeOfDay(hour: 18, minute: 0), // Set your desired end time
                      );
                      if (pickedTime != null) {
                        setState(() {
                          endTime = pickedTime;
                        });
                      }
                    },
                    status: endTime == null
                        ? 'End Time'
                        : 'End Time: ${endTime!.format(context)}',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () async {
                  if (startTime != null && endTime != null) {
                    // Process the selected date and time range
                    print('Selected Date: $selectedDate');
                    print('Start Time: ${startTime!.format(context)}');
                    print('End Time: ${endTime!.format(context)}');
                    AwesomeDialog(context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.scale,
                      title: "Submit",
                      desc: "Please Select way of Pay money",
                      btnCancelText: "On Ground",
                      btnCancelColor: Colors.cyan,
                      btnOkText: "Online",
                      btnCancelOnPress: (){
                      FirebaseFunctions.addReservationToFirestore(profile: widget.profile , pitch: widget.pitch, paymentStatues: "onsite", date: selectedDate , startTime: startTime ! , endTime:  endTime!);
                      GoRouter.of(context).pushReplacement(AppRouter.KUserHome);
                      },
                      btnOkOnPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PaymentPage(pitch: widget.pitch, profile: widget.profile, selectDate: selectedDate  , startTime: startTime!  ,endTime: endTime! ,);
                      }));
                      }
                    ).show();
                    // You can add your booking logic here
                  } else {
                    AwesomeDialog(context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.scale,
                      title: "Error",
                      desc: "Please Choose Date and Range Time",
                      btnCancelOnPress: (){},
                    ).show();
                  }
                },
                status: 'Book',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
