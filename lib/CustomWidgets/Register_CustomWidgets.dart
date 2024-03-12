import 'package:flutter/material.dart';
import 'Custom_TextField.dart';

Widget buildFieldRow(String labelText,String hint, String imagePath, TextEditingController controller) {
  return Row(
    children: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
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
        child: buildTextField(labelText, hint, false, labelText == 'Email', controller),
      ),
    ],
  );
}

void snackbar(BuildContext context, String title, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 5), // Adjust the duration as needed
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

