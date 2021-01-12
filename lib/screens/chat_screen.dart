import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder(builder: (context, snapshot) {
              return Container();
            }),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: 'Type your message here...'),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    print('send');
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
