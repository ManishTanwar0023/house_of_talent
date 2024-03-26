import 'package:flutter/material.dart';
import 'package:house_of_talent/Model/ApiCallingMethods.dart';
import 'package:house_of_talent/Screens/LogIn.dart';
import '../Colors/Palette.dart';
import '../CustomWidgets/BuildButton_CustomWidget.dart';
import '../CustomWidgets/Register_CustomWidgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

var firstname = TextEditingController();
var lastname = TextEditingController();
var email = TextEditingController();
var phone_num = TextEditingController();

class _RegisterState extends State<Register> {
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
                  height: size.height * 0.38,
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
                      'Registration Form',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 170,
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
                    buildFieldRow('First Name', 'First Name', 'assets/images/user.png', firstname),
                    buildFieldRow('Last Name', 'Last Name', 'assets/images/user.png', lastname),
                    buildFieldRow('Email', 'Email', 'assets/images/mail.png', email),
                    buildFieldRow('Phone No.', 'Phone No.', 'assets/images/phone.png', phone_num),
                    SizedBox(height: 30),
                    buildButton('Register', () {
                      register(context, type: 'Register', fname: firstname.text, lname: lastname.text, email: email.text, ph: phone_num.text, gender: " ", DOB: " ", username: " ", image: " ", BIO: " ", Insta: " ", YT: " ");
                      }),
                    SizedBox(height: 10),
                    buildButton('Log In', () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return LogIn();
                      },));
                    }),
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ],
      ),
    );
  }
}
