import 'package:chatty/components/rounded_corner_button.dart';
import 'package:chatty/components/rounded_corner_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  static String id = 'sign_in';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email, pass;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                child: RoundedCornerTextField(
                  hintText: 'Enter Your Email',
                  textInputType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
                child: RoundedCornerTextField(
                  hintText: 'Enter your password',
                  obscureText: true,
                  onChanged: (value) {
                    pass = value;
                  },
                ),
              ),
              RoundedCornerButton(
                title: 'Sign in',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: pass);
                    if (newUser != null) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.id, (route) => false);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
