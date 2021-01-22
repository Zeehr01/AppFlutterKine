import 'package:kine_app/helper/helperfunctions.dart';
import 'package:kine_app/helper/password_generator.dart';
import 'package:kine_app/services/auth.dart';
import 'package:kine_app/services/database.dart';
import 'package:kine_app/views/patientOverView.dart';
import 'package:kine_app/views/patientView.dart';
import 'package:kine_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'dart:math';

class AjoutPatient extends StatefulWidget {
  //final Function toggleView;
  //AjoutPatient(this.toggleView);

  @override
  _AjoutPatient createState() => _AjoutPatient();
}

class _AjoutPatient extends State<AjoutPatient> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController prenomEditingController = new TextEditingController();
  TextEditingController numTelephoneEditingController =
      new TextEditingController();
  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String generatePassword(bool _isWithLetters, bool _isWithUppercase,
      bool _isWithNumbers, bool _isWithSpecial, double _numberCharPassword) {
    //Define the allowed chars to use in the password
    String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
    String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String _numbers = "0123456789";
    String _special = "@#=+!£\$%&?[](){}";

    //Create the empty string that will contain the allowed chars
    String _allowedChars = "";

    //Put chars on the allowed ones based on the input values
    _allowedChars += (_isWithLetters ? _lowerCaseLetters : '');
    _allowedChars += (_isWithUppercase ? _upperCaseLetters : '');
    _allowedChars += (_isWithNumbers ? _numbers : '');
    _allowedChars += (_isWithSpecial ? _special : '');

    int i = 0;
    String _result = "";

    //Create password
    while (i < _numberCharPassword.round()) {
      //Get random int
      int randomInt = Random.secure().nextInt(_allowedChars.length);
      //Get random char and append it to the password
      _result += _allowedChars[randomInt];
      i++;
    }

    return _result;
  }

  sendMail() async {
    String username = 'test.kine5119@gmail.com';
    String password = 'test@5119';
    String destination = emailEditingController.text.trim();
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Kine')
      ..recipients.add(Address(destination))
      ..subject = "Vos identifiants pour l'application Kine :: 😀 ::"
      ..text = 'voici vos coordonnées !!!'
      ..html =
          "<h1>Kinetherapie</h1>\n<p>Bonjour ! Vous pouvez accéder à vos programmes via notre application Kine en utilisant </br> en utilisant ce mail" +
              emailEditingController.text.trim() +
              "et ce mot de passe</p>" +
              passwordEditingController.text;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  singUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signUpWithEmailAndPassword(emailEditingController.text.trim(),
              passwordEditingController.text)
          .then((result) {
        if (result != null) {
          Map<String, String> userDataMap = {
            "name": usernameEditingController.text,
            "email": emailEditingController.text.trim(),
            "mdpasse": passwordEditingController.text,
            "numero": numTelephoneEditingController.text,
            "prenom": prenomEditingController.text,
          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              usernameEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PatientViewList()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMainAjoutPatient(context),
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
                      children: [
                        TextFormField(
                          style: simpleTextFieldSty(),
                          controller: usernameEditingController,
                          validator: (val) {
                            return val.isEmpty || val.length < 3
                                ? "entez un prenom valide"
                                : null;
                          },
                          decoration: textFieldInputDecoration("Nom"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          style: simpleTextFieldSty(),
                          controller: prenomEditingController,
                          validator: (val) {
                            return val.isEmpty || val.length < 3
                                ? "entez un prenom valide"
                                : null;
                          },
                          decoration: textFieldInputDecoration("Prénom"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          style: simpleTextFieldSty(),
                          controller: numTelephoneEditingController,
                          validator: (val) {
                            //String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                    .hasMatch(val)
                                ? null
                                : "Entrez un numero de telephone valide";
                          },
                          decoration:
                              textFieldInputDecoration("Numéro de téléphone"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: emailEditingController,
                          style: simpleTextFieldSty(),
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                                ? null
                                : "Enter correct email";
                          },
                          decoration: textFieldInputDecoration("email"),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordEditingController,
                          style: simpleTextFieldSty(),
                          decoration: InputDecoration(
                            hintText: "mot de passe",
                            hintStyle: TextStyle(color: Color(0xFFE0E0E0)),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.arrow_circle_down_sharp,
                                  color: Colors.green),
                              onPressed: () {
                                generatePassword(true, true, true, false, 17);
                              },
                            ),
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 8.0)),
                          ),
                          //generatePassword(true, true, true, false, 17);
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      singUp();
                      sendMail();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
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
