import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class HomePagePopupMenuButton extends StatelessWidget {
  const HomePagePopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      position: PopupMenuPosition.under,
      icon: Icon(CupertinoIcons.add_circled),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'New Chat',
            child: const ListTile(
                leading: Icon(CupertinoIcons.chat_bubble_2_fill),
                title: Text('New Chat', maxLines: 1)),
            onTap: () => showNewPeerChatDialog(context),
          ),
          PopupMenuItem(
            value: 'New Group',
            child: const ListTile(
                leading: Icon(CupertinoIcons.person_2_fill),
                title: Text('New Group', maxLines: 1)),
            onTap: () => showNewGroupChatDialog(context),
          ),
          PopupMenuItem(
            value: 'Join Group',
            child: const ListTile(
                leading: Icon(CupertinoIcons.chat_bubble_2_fill),
                title: Text('Join Group', maxLines: 1)),
            onTap: () => showJoinGroupDialog(context),
          ),
        ];
      },
    );
  }

  void showNewPeerChatDialog(BuildContext context) {
    try {
      ZIMKit().showDefaultNewPeerChatDialog(context);
    } catch (e) {
      // Handle dialog error
      print('Error showing new peer chat dialog: $e');
    }
  }

  void showNewGroupChatDialog(BuildContext context) {
    try {
      ZIMKit().showDefaultNewGroupChatDialog(context);
    } catch (e) {
      // Handle dialog error
      print('Error showing new group chat dialog: $e');
    }
  }

  void showJoinGroupDialog(BuildContext context) {
    try {
      ZIMKit().showDefaultJoinGroupDialog(context);
    } catch (e) {
      // Handle dialog error
      print('Error showing join group dialog: $e');
    }
  }
}
