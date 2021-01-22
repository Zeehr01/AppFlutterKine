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

import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String linkOfImage;
  final Color color;
  final Text label;
  final Color textColor;
  final Function action;

  CategoryButton(
      {Key key,
      this.linkOfImage,
      @required this.color,
      @required this.label,
      @required this.textColor,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (RaisedButton.icon(
      icon: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Image.asset(linkOfImage, width: 30, height: 30)),
      padding: EdgeInsets.fromLTRB(28, 11, 28, 11),
      color: color,
      textColor: textColor,
      shape: StadiumBorder(),
      onPressed: () => {action()},
      label: label,
    ));
  }
}
