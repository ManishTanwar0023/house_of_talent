import 'package:flutter/material.dart';

Widget buildFieldRowDatePicker(String labelText, String hint, String imagePath, TextEditingController controller ,BuildContext context) {
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
      SizedBox(width: 30), // Add space between circle avatar and text field
      Expanded(
        child: GestureDetector(
          onTap: () {
            _selectDate(context, controller); // Open date picker
          },
          child: AbsorbPointer(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hint,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null) {
    controller.text = "${picked.day}/${picked.month}/${picked.year}"; // Update text field with selected date
  }
}
