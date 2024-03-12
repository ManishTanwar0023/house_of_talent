import 'package:flutter/material.dart';

import '../Colors/Palette.dart';
import '../CustomWidgets/BuildButton_CustomWidget.dart';
import '../CustomWidgets/Register_CustomWidgets.dart';
import 'OTP_Validation.dart';
import 'Register.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2, // Adjust underline thickness
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.08),
                    buildFieldRow('Phone No.', 'Phone No.','assets/images/phone.png', phone_num),
                    SizedBox(height: size.height*0.25),
                    buildButton('Send OTP', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OTP_Validation(),));
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
}
