import 'package:flutter/material.dart';
import 'package:kine_app/views/kineOverView.dart';
import 'package:kine_app/views/patientOverView.dart';
import '../widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth.dart';
import '../services/databaseuser.dart';
import '../helper/helperfunctions.dart';

class SignIn extends StatefulWidget {
  //final Function toggle;
  //SignIn(this.toggle);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInState();
  }
}
/**
 *  getinformation() async {
    QuerySnapshot userInfoSnapshot =  await DatabaseMethods()
              .getUsersInfo();
              
    String name = userInfoSnapshot.documents[0].data["name"];
    String prenom = userInfoSnapshot.documents[0].data["prenom"];    
    String numero = userInfoSnapshot.documents[0].data["numero"];    
  }
 */

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(emailEditingController.text.trim(),
              passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          QuerySnapshot userInfoSnapshot = await DatabaseMethods()
              .getUserInfo(emailEditingController.text.trim());

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.documents[0].data["name"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.documents[0].data["email"]);
          String name = userInfoSnapshot.documents[0].data["name"];
          if (name == "admin") {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => KineOverView()));
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => PatientOverView()));
          }
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      //padding: EdgeInsets.symmetric(vertical: 60),
                      padding: EdgeInsets.only(top: 50, bottom: 20),
                      child: Text(
                        "Connexion",
                        style:
                            TextStyle(color: Color(0xFF004D40), fontSize: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Saisissez votre email et votre mot de passe pour accéder à votre compte",
                        style: TextStyle(
                          color: Color(0xFFA5D6A7),
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        // height: MediaQuery.of(context).size.height-50,
                        alignment: Alignment.center,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Form(
                            key: formKey,
                            child: Column(
                              //mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  validator: (val) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val)
                                        ? null
                                        : "le mail est incorrect";
                                  },
                                  controller: emailEditingController,
                                  style: simpleTextFieldSty(),
                                  decoration: textFieldInputDecoration("email"),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  validator: (val) {
                                    return val.length > 6
                                        ? null
                                        : "le mot de passe est incorrect";
                                  },
                                  style: simpleTextFieldSty(),
                                  controller: passwordEditingController,
                                  decoration:
                                      textFieldInputDecoration("password"),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                      "Mot de passe oublié ?",
                                      style: simpleTextFieldSty(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    signIn();
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text(
                                      "Connexion",
                                      style: simpleTexStyle(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
