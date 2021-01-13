import 'package:flutter/material.dart';
import '../widgets/widget.dart';

class PatientOverView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PatientOverView();
  }
}

class _PatientOverView extends State<PatientOverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBarMain(context));
  }
}
