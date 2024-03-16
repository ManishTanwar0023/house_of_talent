import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:house_of_talent/Screens/HomeScreen.dart';

import '../Colors/Palette.dart';
import '../CustomWidgets/BuildButton_CustomWidget.dart';
import 'Competition.dart';

class OTP_Validation extends StatefulWidget {
  const OTP_Validation({Key? key});

  @override
  State<OTP_Validation> createState() => _OTP_ValidationState();
}

class _OTP_ValidationState extends State<OTP_Validation> {
  late Timer _timer;
  int remainingSeconds = 120;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        if (remainingSeconds == 0) {
          timer.cancel();
        } else {
          remainingSeconds--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secondsLeft = seconds % 60;
    return '$minutes:${secondsLeft.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.offBlackColor,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  height: size.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/LOGO 1.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Text(
                      'Enter OTP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2, // Adjust underline thickness
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.08),
                    OTPBox(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Resend OTP',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white,
                                      width: 2, // Adjust underline thickness
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                _formatTime(remainingSeconds),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.18),
                    buildButton('Resend OTP', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget OTPBox() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OTPContainer(),
            OTPContainer(),
            OTPContainer(),
            OTPContainer(),
            OTPContainer(),
            OTPContainer(),
          ],
        ),
      ),
    );
  }

  Widget OTPContainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Container(
        height: 50,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextFormField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: InputDecoration(hintText: "0"),
          style: Theme.of(context).textTheme.headline6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
