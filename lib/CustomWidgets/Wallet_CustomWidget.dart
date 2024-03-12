import 'package:flutter/material.dart';
import 'package:house_of_talent/CustomWidgets/Custom_TextField2.dart';

Widget buildFieldRow2(String labelText, String hint, String imagePath, TextEditingController controller) {
  return Row(
    children: [
      Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
      ),
      SizedBox(width: 10), // Add space between circle avatar and text field
      Expanded(
        child: Custom_TextField2(labelText, hint, false, labelText=='Email', controller)
      ),
    ],
  );
}