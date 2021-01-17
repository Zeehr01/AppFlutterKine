import 'package:flutter/material.dart';

import 'AddButton.dart';

class TitleContainer extends StatelessWidget {
  final String title;

  const TitleContainer({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Container(
        padding: EdgeInsets.fromLTRB(10, 20, 20, 13),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 19,
                  color: Colors.black54)),
          AddButton(),
        ])));
  }
}
