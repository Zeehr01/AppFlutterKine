import 'package:flutter/material.dart';
import 'package:kine_app/views/exerciceOverView.dart';
import 'package:kine_app/views/exoEtirement.dart';
import 'package:kine_app/views/exoSpecifique.dart';
import 'package:kine_app/views/patientOverView.dart';
import 'package:kine_app/views/programmeView.dart';
import 'package:kine_app/widgets/AddButton.dart';
import 'package:kine_app/widgets/CategoryButton.dart';
import 'package:kine_app/widgets/Patient.dart';
import 'package:kine_app/widgets/Programme.dart';
import 'package:kine_app/widgets/TitleContainer.dart';
import '../widgets/widget.dart';

class KineOverView extends StatefulWidget {
  //final Function toggleView;
  //KineOverView(this.toggleView);
  @override
  State<StatefulWidget> createState() {
    return _KineOverView();
  }
}

class _KineOverView extends State<KineOverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMainKine(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            TitleContainer(
                title: "Catégorie d'exercices", element: "exercices"),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ButtonBar(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ExerciceOverView();
                          },
                          child: CategoryButton(
                            linkOfImage: "assets/icons/Etirements.png",
                            color: Colors.deepOrangeAccent,
                            label: Text("Etirements"),
                            textColor: Colors.white,
                          ),
                        ),
                        CategoryButton(
                            linkOfImage: "assets/icons/musculation.png",
                            color: Colors.amberAccent,
                            label: Text("Musculation"),
                            textColor: Colors.black54),
                        GestureDetector(
                          onTap: () {
                            ExoSpecifique();
                          },
                          child: CategoryButton(
                              linkOfImage: "assets/icons/specific.png",
                              color: Colors.cyan,
                              label: Text("Spécifiques"),
                              textColor: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )),
            TitleContainer(title: "Mes programmes", element: "programmes"),

            Container(
                height: 250,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ProgrammeView()),

            //Programme(),
            TitleContainer(title: "Mes patients", element: "patients"),
            //Patient()
            Container(
                height: 250,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: PatientOverView()),
          ]),
        ),
      ),
    );
  }
}
