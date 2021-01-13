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
    return Scaffold(
      appBar: appBarMain(context),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
            ),
            const Icon(
              Icons.article_rounded,
              color: Color(0xFFA5D6A7),
              size: 40.0,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Mes Programmes :",
              style: TextStyle(
                color: Color(0xFF329C9D),
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ]),
    );
  }
}
