import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_2/widgets/base_card.dart';

import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return Scaffold(
      body: Column(
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
              child: const Text(
                'Create Account',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                } catch (e) {
                  print(e);
                }
              },
            ),
            theColor: kNavBarColor,
          ),
        ],
      ),
    );
  }
}
