import 'dart:io';
import 'package:house_of_talent/CustomWidgets/TermAndConditionCustomText.dart';
import 'package:house_of_talent/Model/ApiCallingMethods.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CustomWidgets/BuildButtonWithIcon_CustomWidget.dart';

class PostPage extends StatefulWidget {
  const PostPage();

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool isChecked = false;
  bool videoUploaded = false;
  String video = 'assets/images/girl.png';
  List<File> pickedFiles = [];
  bool isfilled = false;
  late String userid ='';

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    var description = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    child: Image.asset(video, fit: BoxFit.cover),
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
                        controller: description,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Describe your video',
                          hintStyle: TextStyle(fontSize: 12),
                        ),
                        maxLines: 8,
                        maxLength: 250,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock, size: 30),
                      Text(
                        'Who Can View This Video',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Public',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(Icons.arrow_forward_ios_outlined, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(width: 1)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  TermAndConditionCustomText()
                ],
              ),
              SizedBox(height: size.height * 0.2),
              InkWell(
                onTap: () {},
                child: buildButtonWithIcon(Icons.drafts_outlined, 'Draft'),
              ),
              SizedBox(height: 15),
              videoUploaded? InkWell(
                onTap: () {
                  storeFilesLocally().then((_) {
                          // Once files are stored locally, proceed with upload
                          uploadFiles();
                          AddPost(context, mode: 'Public', D: description.text, Thumbnail: '', creator: userid, video: video);
                        });
                },
                child: buildButtonWithIcon(Icons.cloud_upload, 'Upload Video'),
              )
                  : InkWell(
                onTap: () {
                  pickFile();
                },
                child: buildButtonWithIcon(Icons.cloud_upload, 'Post Video'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> retrieveData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedPhone = prefs.getString("phone");
    setState(() {
      if(storedPhone != null){
        userid = storedPhone!;
        print('This is UserID: $userid');
      }
    });
  }

  pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['mp4', 'avi', 'mov'],
    );
    if (result != null) {
      setState(() {
        pickedFiles.clear();
        pickedFiles.add(File(result.files.single.path!));
        videoUploaded = true; // Update videoUploaded to true
      });
    }
  }

  Future<void> uploadFiles() async {
    for (File file in pickedFiles) {
      print('Uploading file: ${file.path}');
      setState(() {
        isfilled = true;
      });
    }
  }

  Future<void> storeFilesLocally() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    for (File file in pickedFiles) {
      String fileName = path.basename(file.path);
      String newPath = '${appDir.path}/$fileName';
      await file.copy(newPath);
      print('File stored locally: $newPath');
    }
  }
}
