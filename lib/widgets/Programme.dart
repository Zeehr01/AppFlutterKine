import 'package:flutter/material.dart';
import 'package:kine_app/widgets/ProgrammeElement.dart';

class Programme extends StatefulWidget {
  @override
  _ProgrammeState createState() => _ProgrammeState();
}

class _ProgrammeState extends State<Programme> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(height: 5),
              ProgrammeElement(),
              SizedBox(height: 12),
              ProgrammeElement(),
              SizedBox(height: 5),
              ProgrammeElement(),
              SizedBox(height: 12),
            ])));
  }
}
