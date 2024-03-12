import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import 'HomeScreen_Test.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

var userId = TextEditingController();
var userName = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
            TextFormField(
              controller: userId,
              decoration: InputDecoration(
                labelText: 'User Id',
                border: OutlineInputBorder()
              ),
            ),
              SizedBox(height: 20,),
              TextFormField(
                controller: userName,
                decoration: InputDecoration(
                    labelText: 'User Name',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () async {
                await ZIMKit().connectUser(id: userId.text, name: userName.text);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
              }, child: Text('Login'))
          ],),
        ),
      ),
    );
  }
}
