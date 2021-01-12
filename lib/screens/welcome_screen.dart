import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatty/components/rounded_corner_button.dart';
import 'package:chatty/screens/registration_screen.dart';
import 'package:chatty/screens/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TypewriterAnimatedTextKit(
                speed: Duration(milliseconds: 500),
                text: ["Chatty"],
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 45,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RoundedCornerButton(
              title: 'Sign in',
              onPressed: () {
                Navigator.pushNamed(context, SignIn.id);
              },
            ),
            RoundedCornerButton(
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
