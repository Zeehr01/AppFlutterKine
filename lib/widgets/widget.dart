import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(title: Text('Kine App'));
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
