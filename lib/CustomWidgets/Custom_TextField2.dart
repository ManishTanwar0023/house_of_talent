import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget Custom_TextField2 (String labelText, String hintText, bool isPassword, bool isEmail, TextEditingController controller){
  return Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 2,),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black,fontSize: 20), // Change label color to black
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12, color: Colors.black),
        contentPadding: EdgeInsets.all(5),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    ),
  );
}