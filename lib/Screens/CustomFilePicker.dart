import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:house_of_talent/Screens/PostPage.dart';
import 'package:path/path.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class CustomFilePicker extends StatefulWidget {
  const CustomFilePicker({Key? key});

  @override
  State<CustomFilePicker> createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  List<File> pickedFile = [];
  bool isfilled = false;

  Future<void> uploadFiles() async {
    pickedFile.forEach((file) {
      print('Uploading file: ${file.path}');
      // Add your upload logic here
    });
  }

  Future<void> storeFilesLocally() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    for (File file in pickedFile) {
      String fileName = basename(file.path);
      String newPath = '${appDir.path}/$fileName';
      await file.copy(newPath);
      print('File stored locally: $newPath');
    }
  }

  pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['mp4', 'avi', 'mov'],
    );
    if (result != null) {
      setState(() {
        pickedFile = result.files.map((file) => File(file.path!)).toList();
        isfilled = true;
      });
    }
  }

  openFile(File file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Upload your Video',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Container(
                height: size.height * 0.4,
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/upload_arrow.png'),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: pickFile,
              child: Text(
                'Upload Video',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            pickedFile.isNotEmpty
                ? ListView.builder(
              itemCount: pickedFile.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => openFile(pickedFile[index]),
                  child: Card(
                    child: ListTile(
                      leading: returnLogo(pickedFile[index]),
                      subtitle: Text(
                        'File: ${pickedFile[index].path}',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                );
              },
            )
                : Container(),
            SizedBox(height: 20),
            isfilled
                ? ElevatedButton(
              onPressed: () {
                storeFilesLocally().then((_) {
                  // Once files are stored locally, proceed with upload
                  uploadFiles();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostPage()),
                  );
                });
              },
              child: Text(
                'Upload Files',
                style: TextStyle(fontSize: 24),
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget returnLogo(File file) {
    var ex = extension(file.path);
    if (ex == '.mp4') {
      return Icon(Icons.my_library_add, color: Colors.red);
    }
    // Return a default icon or widget if the file extension is not recognized
    return Icon(Icons.insert_drive_file);
  }
}
