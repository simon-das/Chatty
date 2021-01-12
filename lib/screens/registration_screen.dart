import 'package:chatty/components/rounded_corner_button.dart';
import 'package:chatty/components/rounded_corner_text_field.dart';
import 'package:chatty/screens/sign_in_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email, pass, firstName, lastName;
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
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: RoundedCornerTextField(
                        hintText: 'First Name',
                        onChanged: (value) {
                          firstName = value;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: RoundedCornerTextField(
                        hintText: 'Last Name',
                        onChanged: (value) {
                          lastName = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
                title: 'Register',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: pass);
                    if (newUser != null) {
                      _firestore.collection('users').doc(email).set({
                        'name': firstName + ' ' + lastName,
                      });
                      _firestore.doc('users_count/users_count').update({
                        'count': FieldValue.increment(1),
                      });
                      Navigator.pushNamedAndRemoveUntil(
                          context, SignIn.id, (route) => false);
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
