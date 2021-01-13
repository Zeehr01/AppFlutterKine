import 'package:flutter/material.dart';
import '../widgets/widget.dart';

class SignIn extends StatefulWidget {
  //final Function toggle;
  //SignIn(this.toggle);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBarMain(context),
      body: Column(
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
              style: TextStyle(color: Color(0xFF004D40), fontSize: 20),
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
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration("email")),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                        style: simpleTextFieldStyle(),
                        decoration: textFieldInputDecoration("Mot de passe")),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "Mot de passe oublié ?",
                          style: simpleTextFieldSty(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
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
                        "Connexion",
                        style: simpleTexttyle(),
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
        ],
      ),
    );
  }
}
