import 'package:flutter/material.dart';

Widget Custom_TextField3(String labelText, String hintText, bool isPassword, bool isEmail, TextEditingController controller, String selectedGender, ValueChanged<String?>? onChanged) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 2),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: selectedGender,
          onChanged: onChanged,
          items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black, fontSize: 20),
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
        SizedBox(height: 10), // Adjust spacing between dropdown and TextField if needed
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: "Enter your text here",
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
      ],
    ),
  );
}
