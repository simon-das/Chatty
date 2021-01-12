import 'package:flutter/material.dart';

class RoundedCornerButton extends StatelessWidget {
  RoundedCornerButton({this.title, this.onPressed});
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 0),
      child: Material(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(50),
        elevation: 5,
        child: MaterialButton(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
