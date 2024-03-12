import 'package:flutter/material.dart';

class CustomCommentsContainerWidget extends StatelessWidget {
  CustomCommentsContainerWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/images/LOGO.png'),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('Anonymous'),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // handle more icon click
                    },
                    icon: Icon(Icons.more_vert_outlined),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 1),
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 1),
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 1),
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 1),
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 1),
              ],
            ),
            SizedBox(height: 5),
        Text("Excellent reading, simple remedies. Felt very\n"
            "reassured after speaking with her. Polite and quick"),
        SizedBox(height: 2,),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 2),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: Colors.black26
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('jasdeep',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                  Text('Thanks Urvashi'),
                ],
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}
