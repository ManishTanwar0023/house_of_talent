import 'package:flutter/material.dart';

import '../Colors/Palette.dart';
import 'Registration_Login_Page.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  _navigateToNextPage() async {
    await Future.delayed(
      const Duration(seconds: 4),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Registration_Login_Page()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.offBlackColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/BGR_LOGO_1.png'))),
          ),
        ),
      ),
    );
  }
}
