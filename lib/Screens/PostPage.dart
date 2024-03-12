import 'package:flutter/material.dart';
import 'package:house_of_talent/CustomWidgets/TermAndConditionCustomText.dart';

import '../CustomWidgets/BuildButtonWithIcon_CustomWidget.dart';

class PostPage extends StatefulWidget {
  const PostPage();

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: size.height * 0.25,
                    width: size.width * 0.33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Image(image: AssetImage('assets/images/girl.png'),fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: size.height * 0.25,
                    width: size.width * 0.59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Describe your video',
                          hintStyle: TextStyle(fontSize: 12), // Set the font size here
                        ),
                        maxLines: 8,
                        maxLength: 250,
                        style: TextStyle(fontSize: 12), // Set the font size of entered text here
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(Icons.lock,size: 30,),
                    Text('Who Can View This Video',style: TextStyle(fontWeight: FontWeight.w500),),
                
                  ],),
                  Row(
                    children: [
                      Text('Public',style: TextStyle(fontWeight: FontWeight.bold),),
                      InkWell(
                          onTap: (){},
                          child: Icon(Icons.arrow_forward_ios_outlined,size: 30,)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Container(height: 2,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(width: 1)),),
              SizedBox(height: 10,),
              Row(children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                TermAndConditionCustomText(),
              ],),
              SizedBox(height: size.height*0.2),
              InkWell(
                onTap: (){},
                  child: buildButtonWithIcon(Icons.drafts_outlined, 'Draft')),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){},
                  child: buildButtonWithIcon(Icons.cloud_upload, 'Post Video'))
            ],
          ),
        ),
      ),
    );
  }
}