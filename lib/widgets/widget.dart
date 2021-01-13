import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(130.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Vue globale',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
/*
Column(children: <Widget>[
        const Icon(
          Icons.home,
          color: Colors.white,
          size: 30.0,
        ),
      ]),*/
      leading: Center(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.home,
            color: Colors.white,
            size: 30.0,
          ),
        ],
      )),
      actions: [
        Icon(
          Icons.account_circle_rounded,
          color: Colors.white,
          size: 50.0,
        ),
        SizedBox(
          height: 8,
        ),
        /*Container(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              "Zahra",
              style: simpleTextFieldStyle(),
            ),
          ),
        ),*/
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Color(0xFFE0E0E0)),
    border: new OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(20.0),
      ),
    ),
  );
}

TextStyle simpleTextFieldStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

TextStyle simpleTexttyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}

TextStyle simpleTextFieldSty() {
  return TextStyle(color: Color(0xFFA5D6A7), fontSize: 16);
}
