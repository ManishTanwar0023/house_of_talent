import 'package:flutter/material.dart';

import '../CustomWidgets/CustomCommentsContainerWidget.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Text('This is the bottom sheet content'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
              topLeft: Radius.circular(15)
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Comments', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
              ),
              CustomCommentsContainerWidget(),
              CustomCommentsContainerWidget(),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                  border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10)
                ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: InkWell(
                          child: Icon(Icons.search),
                          onTap: () {
                            _showBottomSheet(); // Call function to show bottom sheet
                          },
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type here",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

