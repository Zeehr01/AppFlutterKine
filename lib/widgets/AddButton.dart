import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const PrimaryColor = Color(0xFFA5D6A7);
    // TODO: implement build
    return InkWell(
      onTap: () => {print("container clicked !")},
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: PrimaryColor),
        padding: EdgeInsets.all(5),
        child: Icon(Icons.add_outlined, color: Colors.white),
      ),
    );
  }
}
