import 'package:chatty/components/single_user.dart';
import 'package:chatty/screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersFragment extends StatefulWidget {
  @override
  _UsersFragmentState createState() => _UsersFragmentState();
}

class _UsersFragmentState extends State<UsersFragment> {
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
        List<SingleUser> userList = [];
        for (var user in users) {
          userList.add(SingleUser(
            userName: user.data()['name'],
            onTap: () {
              print(user.documentID);
              Navigator.pushNamed(context, ChatScreen.id);
            },
          ));
        }
        return ListView(
          children: userList == null ? Container() : userList,
        );
      },
    );
  }
}
