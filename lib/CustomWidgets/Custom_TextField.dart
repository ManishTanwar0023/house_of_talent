import 'package:flutter/material.dart';
import 'package:house_of_talent/Colors/Palette.dart';

Widget buildTextField(String labelText, String hintText, bool isPassword, bool isEmail, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20,top: 5,bottom: 5),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      style: TextStyle(color: Colors.white), // Set text color to white
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white), // Set label text color to white
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 15, color: Colors.white),
        contentPadding: EdgeInsets.all(5),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white,width: 2), // Set underline color to white
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Palette.offRedColor),
        ),
      ),
    ),
  );
}
