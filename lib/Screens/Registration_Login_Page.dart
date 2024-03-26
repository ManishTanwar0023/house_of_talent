import 'package:flutter/material.dart';
import 'package:house_of_talent/CustomWidgets/Register_CustomWidgets.dart';
import 'package:house_of_talent/Screens/LogIn.dart';

import '../Colors/Palette.dart';
import '../CustomWidgets/BuildButton_CustomWidget.dart';
import '../Model/ApiCallingMethods.dart';
import 'Register.dart';

class Registration_Login_Page extends StatefulWidget {
  const Registration_Login_Page({super.key});

  @override
  State<Registration_Login_Page> createState() => _Registration_Login_PageState();
}

class _Registration_Login_PageState extends State<Registration_Login_Page> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.offBlackColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: size.height * 0.45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/BGR_LOGO_1.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: size.height * 0.47,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            // Handle login with Gmail
                          },
                          child: Container(
                            height: size.height * 0.07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(image: AssetImage('assets/images/gmail.png')),
                                  SizedBox(width: 15),
                                  Text(
                                    'Log In With Gmail',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(child: Text('Or', style: TextStyle(color: Colors.white))),
                        InkWell(
                          onTap: () {
                            // Handle login with Facebook
                          },
                          child: Container(
                            height: size.height * 0.07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(image: AssetImage('assets/images/facebook.png')),
                                  SizedBox(width: 15),
                                  Text(
                                    'Log In With Facebook',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(child: Text('Or', style: TextStyle(color: Colors.white))),
                        buildButton('Register', () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        }),
                        Center(child: Text('Or', style: TextStyle(color: Colors.white))),
                        buildButton('Log In', () {
                          
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                        }),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
