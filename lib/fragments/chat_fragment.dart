import 'package:chatty/components/single_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatFragment extends StatefulWidget {
  @override
  _ChatFragmentState createState() => _ChatFragmentState();
}

class _ChatFragmentState extends State<ChatFragment> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final users = snapshot.data.documents;
        List<SingleChat> userList = [];
        for (var user in users) {
          userList.add(SingleChat(userName: user.data()['name']));
        }
        return ListView(
          children: userList == null ? Container() : userList,
        );
      },
    );
  }
}
