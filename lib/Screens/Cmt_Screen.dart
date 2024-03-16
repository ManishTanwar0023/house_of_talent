import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

import '../CustomWidgets/HomePagePopupMenuButton.dart';

class Cmt_Screen extends StatefulWidget {
  const Cmt_Screen({super.key});

  @override
  State<Cmt_Screen> createState() => _Cmt_ScreenState();
}

class _Cmt_ScreenState extends State<Cmt_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Text('Conversation'),
        actions: [HomePagePopupMenuButton()],
      ),
      body: ZIMKitConversationListView(
        onPressed: (context, conversation, defaultAction) async {
          await navigateToMessageListPage(context, conversation);
        },
      ),
    );
  }

  Future<void> navigateToMessageListPage(
      BuildContext context, ZIMKitConversation conversation) async {
    try {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ZIMKitMessageListPage(
            conversationID: conversation.id,
            conversationType: conversation.type,
          ),
        ),
      );
    } catch (e) {
      // Handle navigation error
      print('Error navigating to message list page: $e');
    }
  }
}

