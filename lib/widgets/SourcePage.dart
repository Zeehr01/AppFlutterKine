import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CameraButtonWidget.dart';
import 'GalleryButtonWidget.dart';

class SourcePage extends StatelessWidget {
  static const PrimaryColor = Color(0xFFA5D6A7);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: PrimaryColor,
            title: Center(
              child: Text("Ajouter un exercice"),
            ),
          ),
        ),
        body:
            ListView(children: [CameraButtonWidget(), GalleryButtonWidget()]));
  }
}
