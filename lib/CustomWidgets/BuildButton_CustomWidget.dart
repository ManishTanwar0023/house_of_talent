import 'package:flutter/material.dart';

import '../Colors/Palette.dart';

Widget buildButton(String text, Function()? onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.offRedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}