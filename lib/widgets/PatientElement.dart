import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kine_app/services/databaseuser.dart';

class PatientElement extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<PatientElement> {
  Future<List<String>> getinformation() async {
    QuerySnapshot userInfoSnapshot = await DatabaseMethods().getUsersInfo();

    String name = userInfoSnapshot.documents[0].data["name"];
    String prenom = userInfoSnapshot.documents[0].data["prenom"];
    String numero = userInfoSnapshot.documents[0].data["numero"];
    List<String> str;
    str.add(name);
    str.add(prenom);
    str.add(numero);
    return str;
  }

  @override
  Widget build(BuildContext context) {
    Future<List<String>> str = getinformation();
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        width: 120,
        child: Column(children: [
          Text("Nom"),
          SizedBox(height: 3),
          Text("Prénom"),
          SizedBox(height: 5),
          Text("Numéro"),
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
