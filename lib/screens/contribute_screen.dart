import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/base_card.dart';
import '../constants.dart';

class ContributeScreen extends StatefulWidget {
  const ContributeScreen({Key? key}) : super(key: key);

  @override
  State<ContributeScreen> createState() => _ContributeScreenState();
}

class _ContributeScreenState extends State<ContributeScreen> {
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;
  bool morning_bool = false;
  bool afternoon_bool = false;
  bool evening_bool = false;
  late String user;

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    user = _auth.currentUser?.email ?? "none";
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAuth.instance.currentUser == null
          ? Center(
              child: BaseCard(
                  theColor: kNavBarColor,
                  theChild: const Text(
                    "You need to be signed in",
                    style: TextStyle(fontSize: 35),
                  )),
            )
          : Column(
              children: [
                BaseCard(
                  theChild: const Text(
                    "When will you use the express way?",
                    style: TextStyle(fontSize: 30),
                  ),
                  theColor: kNavBarColor,
                ),
                Row(
                  children: <Widget>[
                    //SizedBox
                    const Text(
                      '06:00 - 10:00',
                      style: TextStyle(fontSize: 17.0),
                    ), //Text
                    SizedBox(width: 10), //SizedBox
                    Checkbox(
                      value: morning_bool,
                      onChanged: (bool? value) {
                        setState(() {
                          morning_bool = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    //SizedBox
                    const Text(
                      '12:00 - 14:00',
                      style: TextStyle(fontSize: 17.0),
                    ), //Text
                    SizedBox(width: 10), //SizedBox
                    Checkbox(
                      value: afternoon_bool,
                      onChanged: (bool? value) {
                        setState(() {
                          afternoon_bool = value!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    //SizedBox
                    const Text(
                      '17:00 - 19:00',
                      style: TextStyle(fontSize: 17.0),
                    ), //Text
                    SizedBox(width: 10), //SizedBox
                    Checkbox(
                      value: evening_bool,
                      onChanged: (bool? value) {
                        setState(() {
                          evening_bool = value!;
                        });
                      },
                    ),
                  ],
                ),
                BaseCard(
                  theChild: TextButton(
                    child: Text(
                      "Contribute",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print(user.toString());
                      Map<String, dynamic> data = {
                        'User': user,
                        'Morning': morning_bool,
                        'Afternoon': afternoon_bool,
                        'Evening': evening_bool,
                        'Time': FieldValue.serverTimestamp(),
                      };
                      _firestore.collection('contribute').add(data);
                    },
                  ),
                  theColor: kNavBarColor,
                )
              ],
            ),
    );
  }
}
