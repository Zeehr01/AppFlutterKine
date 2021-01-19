import 'package:kine_app/helper/helperfunctions.dart';
import 'package:kine_app/helper/password_generator.dart';
import 'package:kine_app/services/auth.dart';
import 'package:kine_app/services/databaseuser.dart';
import 'package:kine_app/views/patientOverView.dart';
import 'package:kine_app/widgets/widget.dart';
import 'package:flutter/material.dart';

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

  String _generatedPassword = generatePassword(true, true, true, false, 17);
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

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
//   Firestore.instance.collection('users').document().setData({ 'userid': user.uid, 'displayName': 'bobby' });

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              usernameEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PatientOverView()));
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
                          decoration:
                              textFieldInputDecorationPassWord("mot de passe"),
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
