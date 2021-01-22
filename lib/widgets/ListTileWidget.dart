import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onClicked;

  const ListTileWidget({Key key, this.text, this.icon, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
        title: Text(text, style: TextStyle(fontSize: 18)),
        onTap: onClicked,
        leading: Icon(icon, size: 28, color: Colors.orange));
  }
}
