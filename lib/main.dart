import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_2/screens/user_screen.dart';

import 'constants.dart';
import 'screens/records_screen.dart';
import 'screens/contribute_screen.dart';
import 'screens/density_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Express way helper'),
        ),
        bottomNavigationBar: const TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: kNavBarColor,
          tabs: [
            Tab(
              text: 'Records',
              icon: Icon(Icons.book_online),
            ),
            Tab(
              text: 'Density',
              icon: Icon(Icons.car_repair),
            ),
            Tab(
              text: 'Contribute',
              icon: Icon(Icons.schedule),
            ),
            Tab(
              text: 'Log in',
              icon: Icon(Icons.person),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            RecordScreen(),
            DensityScreen(),
            ContributeScreen(),
            UserScreen(),
          ],
        ),
      ),
    );
  }
}
