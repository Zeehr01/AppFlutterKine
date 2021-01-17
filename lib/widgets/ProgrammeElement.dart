import 'package:flutter/material.dart';

class ProgrammeElement extends StatefulWidget {
  @override
  _ProgrammeElementState createState() => _ProgrammeElementState();
}

class _ProgrammeElementState extends State<ProgrammeElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
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
            ]),
        width: double.infinity,
        child: Column(children: [
          Text("Nom du programme :"),
          SizedBox(height: 3),
          Text("Data from db"),
          SizedBox(height: 5),
          Text("Pathologie ciblée :"),
          SizedBox(height: 3),
          Text("Data from DB")
        ]),
        padding: EdgeInsets.fromLTRB(50, 20, 50, 20));
  }
}
