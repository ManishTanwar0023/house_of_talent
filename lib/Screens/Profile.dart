import 'package:flutter/material.dart';

import 'EditProfile.dart';
import 'Personal Information.dart';
import 'Wallet.dart';

class Profile extends StatefulWidget {
  final String Insta;
  final String YT;
  const Profile({required this.Insta,required this.YT});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "@Trandingshorts",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Personal Info'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => PersonalInformation(),));
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Wallet'),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                        builder: (context) => Wallet(),));
                    },
                  ),
                ),
              ],
              icon: Icon(Icons.settings_rounded),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Riya Khiladi',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Content Creator',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image(
                              image: AssetImage('assets/images/instragram.png'),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Instagram ID'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: Image(
                              image: AssetImage('assets/images/youtube.png'),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Youtube Link'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: ShapeDecoration(shape: CircleBorder(
                            side: BorderSide(width: 1)
                        )),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/girl.png'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    Text('Following'),
                    Text('0')
                  ],),
                  Column(children: [
                    Text('Followers'),
                    Text('0')
                  ],),
                  Column(children: [
                    Text('Videos'),
                    Text('2')
                  ],),
                  Column(children: [
                    Text('Competitions'),
                    Text('2')
                  ],),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return EditProfile();
                      }));
                    },
                    child: Container(
                      height: 50,
                      width: size.width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)
                      ),
                      child: Center(child: Text('Edit Profile',style: TextStyle(fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      width: size.width*0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1)
                      ),
                      child: Center(child: Text('Share Profile',style: TextStyle(fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1)
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    height: size.height*0.25,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/girl.png')),
                        border: Border.all(width: 1)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/HouseOfTalent.png')
                                )
                            ),
                          ),
                          Text('120',style: TextStyle(color: Colors.white),)
                        ],)
                      ],
                    ),
                  ),
                  SizedBox(width: 4,),
                  Container(
                    height: size.height*0.25,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/girl.png')),
                        border: Border.all(width: 1)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/HouseOfTalent.png')
                                )
                            ),
                          ),
                          Text('120',style: TextStyle(color: Colors.white),)
                        ],)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
