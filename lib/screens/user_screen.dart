import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_2/constants.dart';

import '../widgets/base_card.dart';
import 'login_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late FirebaseAuth _auth;

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FirebaseAuth.instance.currentUser == null
            ? LoginScreen()
            : Column(
                children: [
                  BaseCard(
                    theChild: const Center(
                      child: Text(
                        "Hello there",
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                    theColor: kNavBarColor,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  BaseCard(
                    theChild: TextButton(
                      child: const Text(
                        "LOGOUT",
                        style: TextStyle(fontSize: 25),
                      ),
                      onPressed: () {
                        setState(() {
                          _auth.signOut();
                        });
                      },
                    ),
                    theColor: kRedButton,
                  ),
                ],
              ));
  }
}
