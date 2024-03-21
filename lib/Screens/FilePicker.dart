import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:open_file/open_file.dart';

class CustomFilePicker extends StatefulWidget {
  const CustomFilePicker({Key? key});

  @override
  State<CustomFilePicker> createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  List<File> pickedFile = [];

  pickFile() async {
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );
    if (result != null) {
      setState(() {
        pickedFile = result.files.map((file) => File(file.path!)).toList();
      });
    }
  }

  openFile(File file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickFile,
              child: Text(
                'Pick File / Files',
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
                : Container()
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
