import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_2/widgets/base_card.dart';
import 'package:project_2/screens/register_screen.dart';

import '../constants.dart';
import 'user_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FirebaseAuth _auth;
  String email = '';
  String password = '';

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
    return FirebaseAuth.instance.currentUser == null
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  bottom: const TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: kNavBarColor,
                    tabs: [
                      Tab(text: "Register"),
                      Tab(text: "Log In"),
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  RegisterScreen(),
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      BaseCard(
                        theChild: TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'email',
                          ),
                        ),
                        theColor: kBox,
                      ),
                      BaseCard(
                        theChild: TextField(
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: const InputDecoration(
                            hintText: 'password',
                          ),
                        ),
                        theColor: kBox,
                      ),
                      BaseCard(
                        theChild: TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                setState(() {
                                  print("$email is in");
                                });
                              } else {
                                print("login failed");
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                        theColor: kNavBarColor,
                      ),
                    ],
                  ),
                ])))
        : const UserScreen();
  }
}
