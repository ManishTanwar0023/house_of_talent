import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget TermAndConditionCustomText(){
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'Before uploading your video, you confirm \nthat you agree to our ',
          style: TextStyle(color: Colors.black),
        ),
        TextSpan(
          text: 'Terms of Use',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Handle 'Terms of Use' tap
              print('Terms of Use tapped');
            },
        ),
        TextSpan(
          text: ' and have \nread and understood our ',
          style: TextStyle(color: Colors.black),
        ),
        TextSpan(
          text: 'Privacy Policy',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Handle 'Privacy Policy' tap
              print('Privacy Policy tapped');
            },
        ),
      ],
    ),
  );
}