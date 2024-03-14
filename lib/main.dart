import 'package:flutter/material.dart';
import 'package:house_of_talent/utils.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import 'Screens/Splash_Screen.dart';

void main() {

  ZIMKit().init(
      appID: Utils.id,
      appSign: Utils.SignIn
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}
