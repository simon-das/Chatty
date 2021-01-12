import 'package:chatty/fragments/chat_fragment.dart';
import 'package:chatty/fragments/users_fragment.dart';
import 'package:chatty/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'main_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, WelcomeScreen.id, (route) => false);
                }),
          ],
          title: Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Center(
              child: Text(
                'Chatty',
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Chat'),
              Tab(text: 'Users'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatFragment(),
            UsersFragment(),
          ],
        ),
      ),
    );
  }
}
