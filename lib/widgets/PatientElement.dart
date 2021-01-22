import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kine_app/services/database.dart';

class PatientElement extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<PatientElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        width: 120,
        child: Column(children: [
          Text("nom"),
          SizedBox(height: 3),
          Text("prenom"),
          SizedBox(height: 5),
          Text("numero"),
          SizedBox(height: 10),
          Icon(Icons.contact_mail, color: Colors.orangeAccent)
        ]),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]));
  }
}
