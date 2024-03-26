import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Colors/Palette.dart';
import '../CustomWidgets/BuildButton_CustomWidget.dart';
import 'HomeScreen.dart';
import 'LogIn.dart';

class OTP_Validation extends StatefulWidget {
  final phone;

  const OTP_Validation({required this.phone});

  @override
  State<OTP_Validation> createState() => _OTP_ValidationState();
}

class _OTP_ValidationState extends State<OTP_Validation> {
  late Timer _timer;
  int remainingSeconds = 120;
  late String generatedOTP;
  late String enterOTP = '';

  late List<TextEditingController> _otpControllers;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _otpControllers = List.generate(6, (index) => TextEditingController());
    generatedOTP = _generateOTP();
    _loadUserData();
  }

  _navigateToNextPage() async {
    enterOTP = _otpControllers.map((controller) => controller.text).join();

    if (generatedOTP == enterOTP) {
      await Future.delayed(
        const Duration(seconds: 3),
            () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
      );
    } else {
      print('Invalid OTP, Please Try Again');
    }
  }

  String _generateOTP() {
    // Generate a random 6-digit OTP
    Random random = Random();
    return List.generate(6, (index) => random.nextInt(10)).join();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var PhoneID = prefs.getString('phone') ?? '';
    prefs.setString('phone', widget.phone);
    if(PhoneID != null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    }
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
    // Dispose controllers to avoid memory leaks
    _otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secondsLeft = seconds % 60;
    return '$minutes:${secondsLeft.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                      fit: BoxFit.fill,
                    ),
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
                    SizedBox(height: 10),
                    Text(
                      'Generated OTP: $generatedOTP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: size.height * 0.07),
                    OTPBox(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    buildButton('Resend OTP', () {}),
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
          children: List.generate(
            6,
                (index) =>
                OTPContainer(
                  controller: _otpControllers[index],
                  onChanged: (value) {
                    FocusScope.of(context).nextFocus();
                    if (_otpControllers.every((controller) =>
                    controller.text.isNotEmpty)) {
                      _navigateToNextPage();
                    }
                  },
                ),
          ),
        ),
      ),
    );
  }
}

  class OTPContainer extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const OTPContainer({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
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
          controller: controller,
          onChanged: onChanged,
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
