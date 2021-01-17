import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String linkOfImage;
  final Color color;
  final Text label;
  final Color textColor;

  CategoryButton(
      {Key key, this.linkOfImage, this.color, this.label, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (RaisedButton.icon(
      icon: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Image.asset(linkOfImage, width: 35, height: 35)),
      padding: EdgeInsets.fromLTRB(28, 11, 28, 11),
      color: color,
      textColor: textColor,
      shape: StadiumBorder(),
      onPressed: () => {},
      label: label,
    ));
  }
}
