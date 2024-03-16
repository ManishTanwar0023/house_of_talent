import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import 'Cmt_Screen.dart';

class Cmt_Login extends StatefulWidget {
  const Cmt_Login({super.key});

  @override
  State<Cmt_Login> createState() => _Cmt_LoginState();
}

class _Cmt_LoginState extends State<Cmt_Login> {

  final userId = TextEditingController();
  final userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(child: Text('Chat Login')),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    TextFormField(controller: userId,
                      decoration: InputDecoration(
                        labelText: 'User ID',
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(controller: userName,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                      ),
                    ),
                    SizedBox(height: 40,),
                    ElevatedButton(onPressed: () async {
                      await ZIMKit().connectUser(id: userId.text,name: userName.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Cmt_Screen(),));
                    }, child: Text('Login'))
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
