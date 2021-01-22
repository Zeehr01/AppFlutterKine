import 'package:kine_app/helper/helperfunctions.dart';
import 'package:kine_app/helper/password_generator.dart';
import 'package:kine_app/services/auth.dart';
import 'package:kine_app/services/database.dart';
import 'package:kine_app/views/exercicesView.dart';
import 'package:kine_app/views/patientOverView.dart';
import 'package:kine_app/views/programmeView.dart';
import 'package:kine_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class AjoutProgramme extends StatefulWidget {
  //final Function toggleView;
  //AjoutProgramme(this.toggleView);
  final String programmeId;
  AjoutProgramme(this.programmeId);

  @override
  _AjoutProgramme createState() => _AjoutProgramme();
}

class _AjoutProgramme extends State<AjoutProgramme> {
  TextEditingController nomProgrammeEditingController =
      new TextEditingController();
  TextEditingController pathologieEditingController =
      new TextEditingController();

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String nom = "", categorie = "", source = "";

  uploadprogrammeExoData() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> questionMap = {
        "nom": nom,
        "categorie": categorie,
        "source": source,
      };

      print("${widget.programmeId}");
      databaseMethods
          .addexercicesToProg(questionMap, widget.programmeId)
          .then((value) {
        nom = "";
        categorie = "";
        source = "";

        setState(() {
          isLoading = false;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("error is happening ");
    }
  }

  ajoutPro() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      {
        Map<String, String> userDataMap = {
          "nom": nomProgrammeEditingController.text.trim(),
          "pathologie_cible": pathologieEditingController.text,
        };
//   Firestore.instance.collection('users').document().setData({ 'userid': user.uid, 'displayName': 'bobby' });

        databaseMethods.addprogrammeinfo(userDataMap);

        HelperFunctions.saveUserLoggedInSharedPreference(true);

        HelperFunctions.saveUserEmailSharedPreference(
            nomProgrammeEditingController.text);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProgrammeView()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMainAjoutProgrammes(context),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: ListView(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nom du programme:",
                          style: simpleTextFieldStyle(),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          style: simpleTextFieldSty(),
                          controller: nomProgrammeEditingController,
                          validator: (val) {
                            return val.isEmpty || val.length < 3
                                ? "entez un prenom valide"
                                : null;
                          },
                          decoration:
                              textFieldInputDecoration("Nom du programme"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Pathologie:",
                            style: simpleTextFieldStyle(),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          style: simpleTextFieldSty(),
                          controller: pathologieEditingController,
                          validator: (val) {
                            return val.isEmpty || val.length < 3
                                ? "entez une Pathologie valide"
                                : null;
                          },
                          decoration: textFieldInputDecoration("Pathologie"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Exercices:",
                            style: simpleTextFieldStyle(),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciceView()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 50 + (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFFA5D6A7),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Sélectionner un exercice ",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      ajoutPro();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 40 + (MediaQuery.of(context).size.width / 2),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color(0xFF329C9D),
                            const Color(0xFF56C596)
                          ]),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "Ajouter",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        //textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
