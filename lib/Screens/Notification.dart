import 'package:flutter/material.dart';
import 'package:house_of_talent/CustomWidgets/CustomNotificationContainer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage();

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Center(
              child: Text('Notification',
                style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomNotificationContainer(),
              CustomNotificationContainer(),
              CustomNotificationContainer(),
              CustomNotificationContainer(),
              CustomNotificationContainer(),
              CustomNotificationContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
