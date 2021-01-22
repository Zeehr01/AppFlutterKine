// Define a custom Form widget.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kine_app/helper/helperfunctions.dart';
import 'package:kine_app/services/auth.dart';
import 'package:kine_app/services/database.dart';
import 'package:kine_app/views/exerciceOverView.dart';
import '../model/media_source.dart';
import 'dart:io';
import 'SourcePage.dart';
import 'CategoryButton.dart';
import 'widget.dart';
import 'video_widget.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  TextEditingController nomEditingController = new TextEditingController();
  TextEditingController categorieEditingController =
      new TextEditingController();
  TextEditingController serieEditingController = new TextEditingController();
  TextEditingController repetitionEditingController =
      new TextEditingController();
  TextEditingController descriptionEditingController =
      new TextEditingController();

  bool isLoading = false;

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  final _formKey = GlobalKey<FormState>();
  File file;

  static const PrimaryColor = Color(0xFFA5D6A7);
  MediaSource source;

  ajoutExos() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> userDataMap = {
        "nom": nomEditingController.text,
        "categorie": categorieEditingController.text.trim(),
        "serie": serieEditingController.text,
        "repetition": repetitionEditingController.text,
        "description": descriptionEditingController.text,
        "source": file.path,
      };

      databaseMethods.addexercicesInfo(userDataMap);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ExerciceOverView()));
    }
  }

  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.file = null;
    });

    final result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(arguments: source)));

    if (result == 0) {
      return;
    } else {
      setState(() {
        file = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMainAjoutPatient(context),
        //SingleChildScrollView(
        //child:
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: ListView(children: [
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                        style: simpleTextFieldSty(),
                        controller: nomEditingController,
                        decoration:
                            textFieldInputDecoration("Nom de l'exercice")),
                    SizedBox(height: 20),
                    TextFormField(
                        style: simpleTextFieldSty(),
                        controller: categorieEditingController,
                        decoration: textFieldInputDecoration("Catégorie")),
                    SizedBox(height: 20),
                    TextFormField(
                        style: simpleTextFieldSty(),
                        controller: serieEditingController,
                        decoration: textFieldInputDecoration("Séries")),
                    SizedBox(height: 20),
                    TextFormField(
                        style: simpleTextFieldSty(),
                        controller: repetitionEditingController,
                        decoration: textFieldInputDecoration("Répétitions")),
                    SizedBox(height: 20),
                    TextFormField(
                        style: simpleTextFieldSty(),
                        controller: descriptionEditingController,
                        decoration: textFieldInputDecoration("Description")),
                    SizedBox(height: 20)
                  ])),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Text('Choisissez un média',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ))),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 30),
                  child: file == null
                      ? Icon(Icons.photo, color: PrimaryColor, size: 40)
                      : source == MediaSource.image
                          ? Image.file(file)
                          : VideoWidget(file)),
              Column(children: [
                CategoryButton(
                  action: () => {capture(MediaSource.image)},
                  linkOfImage: "assets/icons/cloud-computing.png",
                  color: Colors.indigoAccent,
                  textColor: Colors.white,
                  label: Text("Importer une image"),
                ),
                SizedBox(height: 10),
                CategoryButton(
                  action: () => {capture(MediaSource.video)},
                  linkOfImage: "assets/icons/cloud-computing.png",
                  color: Colors.indigoAccent,
                  textColor: Colors.white,
                  label: Text("Importer une vidéo"),
                ),
                SizedBox(height: 60),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(150, 0, 10, 10),
                    child: CategoryButton(
                      action: () => {ajoutExos()},
                      linkOfImage: "assets/icons/add.png",
                      color: PrimaryColor,
                      textColor: Colors.white,
                      label: Text("Ajouter"),
                    ),
                  ),
                ),
                SizedBox(height: 50)
              ]),
            ])));
  }
}
