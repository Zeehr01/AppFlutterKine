import 'package:flutter/material.dart';
import 'package:kine_app/views/ajoutPatient.dart';
import 'package:kine_app/views/ajoutProgramme.dart';
import 'package:kine_app/views/exercicesView.dart';
import 'package:kine_app/views/kineOverView.dart';
import 'package:kine_app/views/patientOverView.dart';
import 'package:kine_app/views/programmeView.dart';
import 'package:kine_app/views/signin.dart';
import './helper/helperfunctions.dart';
import './helper/authenticate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App',
        theme: ThemeData(
          primaryColor: Color(0xFFA5D6A7),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SignIn());
  }
}
