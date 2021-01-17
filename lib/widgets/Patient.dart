import 'package:flutter/cupertino.dart';
import 'PatientElement.dart';

class Patient extends StatefulWidget {
  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Row(children: [PatientElement(), PatientElement()]),
              Row(children: [PatientElement(), PatientElement()]),
              Row(children: [PatientElement(), PatientElement()]),
            ])));
  }
}
