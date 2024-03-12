import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Colors/Palette.dart';

Widget buildButtonWithIcon(IconData icon,String text){

  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Palette.offRedColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon,size: 40,),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}