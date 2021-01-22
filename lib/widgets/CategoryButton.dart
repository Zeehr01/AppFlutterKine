import 'package:flutter/material.dart';
import 'package:kine_app/views/exoEtirement.dart';
import 'package:kine_app/views/exoSpecifique.dart';

class CategoryButton extends StatelessWidget {
  final String linkOfImage;
  final Color color;
  final Text label;
  final Color textColor;
  final String element;

  CategoryButton(
      {Key key,
      this.linkOfImage,
      this.color,
      this.label,
      this.textColor,
      this.element})
      : super(key: key);
/*
  GestureDetector(onTap: () {
      if (element == "Etirements") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ExoEtirement()));
      } else if (element == "Spécifiques") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ExoSpecifique()));
      }
 */
  @override
  Widget build(BuildContext context) {
    return
        //child:
        RaisedButton.icon(
      icon: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Image.asset(linkOfImage, width: 35, height: 35)),
      padding: EdgeInsets.fromLTRB(28, 11, 28, 11),
      color: color,
      textColor: textColor,
      shape: StadiumBorder(),
      onPressed: () => {},
      label: label,
    );
  }
}
