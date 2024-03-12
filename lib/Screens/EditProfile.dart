import 'package:flutter/material.dart';
import 'package:house_of_talent/CustomWidgets/Wallet_CustomWidget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

var Name = TextEditingController();
var UserName = TextEditingController();
var Bio = TextEditingController();

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Edit Profile'),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(side: BorderSide(width: 1)),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/girl.png'),
                        ),
                      ),
                      TextButton(onPressed: () {}, child: Text('Edit Picture'))
                    ],
                  )
                ],
              ),
              buildFieldRow2('Name', 'Name', 'assets/images/user.png', Name),
              buildFieldRow2(
                  'Username', 'Username', 'assets/images/user.png', UserName),
              buildFieldRow2('Bio', 'Bio', 'assets/images/user.png', Bio),
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.08,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(onTap: (){},
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Image(
                            image: AssetImage('assets/images/google-plus.png'),
                          ),
                        ),
                      ),
                    ),
                    Text('Add Link'),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                'Profile Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              TextButton(onPressed: (){}, child: Text('Personal information setting'))
            ],
          ),
        ),
      ),
    );
  }
}
