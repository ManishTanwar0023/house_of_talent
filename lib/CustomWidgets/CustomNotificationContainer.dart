import 'package:flutter/material.dart';

Widget CustomNotificationContainer(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:[
            Row(
              children: [
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/LOGO.png'),
                  ),
                ),
                SizedBox(width: 8),
                Text('Anonymous'),
              ],
            ),
            SizedBox(height: 10,),
            Text("Excellent reading, simple remedies. Felt very\n"
                "reassured after speaking with her. Polite and quick"),
          ],),
      ),
    ),
  );
}