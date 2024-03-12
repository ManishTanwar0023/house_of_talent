import 'package:flutter/material.dart';

class CompetitionCustomHelpWidget extends StatelessWidget {
  final String title;

  const CompetitionCustomHelpWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}