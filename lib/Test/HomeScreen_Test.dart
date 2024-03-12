import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import 'HomePagePopupMenuButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversation'),
        actions: [HomePagePopupMenuButton()],
      ),
      body: Column( // Changed Semantics to Column
        children: [
          Expanded(
            child: ZIMKitConversationListView(
              onPressed: (context, conversation, defaultAction) async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZIMKitMessageListView(
                      conversationID: conversation.id,
                      conversationType: conversation.type,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
