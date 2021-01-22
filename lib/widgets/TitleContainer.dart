import 'package:flutter/material.dart';
import 'package:kine_app/views/exerciceOverView.dart';
import 'package:kine_app/views/exercicesView.dart';
import 'package:kine_app/views/patientOverView.dart';
import 'package:kine_app/views/patientView.dart';
import 'package:kine_app/views/programmeView.dart';
import 'package:kine_app/views/programmeViewlist.dart';

import 'AddButton.dart';

class TitleContainer extends StatelessWidget {
  final String title;
  final String element;

  const TitleContainer({Key key, @required this.title, @required this.element})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
        padding: EdgeInsets.fromLTRB(10, 20, 20, 13),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
            onTap: () {
              //Catégorie d'exercices
              if (title == "Catégorie d'exercices") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExerciceOverView()));
              }
              if (title == "Mes patients") {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PatientViewList()));
              } else if (title == "Mes programmes") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProgrammeViewList()));
              }
            },
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 19,
                    color: Colors.black54)),
          ),
          AddButton(
            element: element,
          ),
        ])));
  }
}
