import 'package:flutter/material.dart';

import '../Colors/Palette.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({super.key});

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.offBlackColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/LOGO 1.png'))),
        ),
      ),
    );
  }
}
