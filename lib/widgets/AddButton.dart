import 'package:flutter/material.dart';
import 'package:kine_app/views/ajoutPatient.dart';

class AddButton extends StatelessWidget {
  String element;
  AddButton({Key key, @required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const PrimaryColor = Color(0xFFA5D6A7);
    return InkWell(
      onTap: () => {
        if (element == "patients")
          {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AjoutPatient()))
          }
        else if (element == "programmes")
          {}
        else if (element == "exercices")
          {}
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: PrimaryColor),
        padding: EdgeInsets.all(5),
        child: Icon(Icons.add_outlined, color: Colors.white),
      ),
    );
  }
}
