import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_2/widgets/base_card.dart';
import 'package:project_2/constants.dart';

class DensityScreen extends StatefulWidget {
  const DensityScreen({Key? key}) : super(key: key);

  @override
  State<DensityScreen> createState() => _DensityScreenState();
}

class _DensityScreenState extends State<DensityScreen> {
  late FirebaseFirestore _firestore;
  late int morning_riders;
  late int afternoon_riders;
  late int evening_riders;

  @override
  void initState() {
    super.initState();
    initFirebase();
    morning_riders = 0;
    afternoon_riders = 0;
    evening_riders = 0;
  }

  void initFirebase() async {
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          BaseCard(
            theChild: const Text(
              "Today's express way speculation",
              style: TextStyle(fontSize: 35),
            ),
            theColor: kNavBarColor,
          ),
          Row(
            children: [
              Text(
                "Morning( 08:00 - 10:00 ): ",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('contribute')
                        .where('Morning', isEqualTo: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        final snap = snapshot.data!.docs;
                        for (var i = 0; i < snap.length; i++) {
                          morning_riders++;
                        }
                      }
                      return Text(
                        " $morning_riders users",
                        style: TextStyle(fontSize: 20),
                      );
                    }),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "Afternoon( 12:00 - 14:00 ): ",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('contribute')
                        .where('Afternoon', isEqualTo: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        final snap = snapshot.data!.docs;
                        for (var i = 0; i < snap.length; i++) {
                          afternoon_riders++;
                        }
                      }
                      return Text(
                        " $afternoon_riders users",
                        style: TextStyle(fontSize: 20),
                      );
                    }),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "Evening( 17:00 - 19:00 ): ",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('contribute')
                        .where('Evening', isEqualTo: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        final snap = snapshot.data!.docs;
                        for (var i = 0; i < snap.length; i++) {
                          evening_riders++;
                        }
                      }
                      return Text(
                        " $evening_riders users",
                        style: TextStyle(fontSize: 20),
                      );
                    }),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
