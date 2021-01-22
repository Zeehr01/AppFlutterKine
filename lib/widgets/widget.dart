import 'package:flutter/material.dart';
import 'package:kine_app/views/kineOverView.dart';

Widget appBarMain(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(120.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Vue globale',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
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
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget appBarMainKine(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(110.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Vue globale',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      leading: Center(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => KineOverView()));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      )),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget appBarMainKineMesPatient(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(110.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Mes patients ',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      leading: Center(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => KineOverView()));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      )),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget appBarMainKineMesProgrammes(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(110.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Mes programmes ',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      leading: Center(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => KineOverView()));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      )),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget appBarMainKineMesExercices(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(110.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Exercices ',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      leading: Center(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => KineOverView()));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      )),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget appBarMainAjoutPatient(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(110.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Ajouter un patient',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      leading: Center(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => KineOverView()));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      )),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: null);
            })
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget appBarMainAjoutexos(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(110.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Ajouter un exercice',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      leading: Center(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => KineOverView()));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      )),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: null);
            })
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    ),
  );
}

Widget appBarMainAjoutProgrammes(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(110.0),
    child: AppBar(
      flexibleSpace: const FlexibleSpaceBar(
        title: const Text(
          'Ajouter un programme',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
      ),
      leading: Center(
          child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => KineOverView()));
            },
            child: const Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      )),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: null);
            })
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
        borderSide: BorderSide(color: Colors.grey, width: 8.0)),
  );
}

InputDecoration textFieldInputDecorationPassWord(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Color(0xFFE0E0E0)),
    suffixIcon: IconButton(
      icon: Icon(Icons.arrow_circle_down_sharp, color: Colors.green),
      onPressed: () {},
    ),
    border: new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
        borderSide: BorderSide(color: Colors.grey, width: 8.0)),
  );
}

TextStyle simpleTextFieldStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle simpleTexttyle() {
  return TextStyle(color: Colors.black, fontSize: 17);
}

TextStyle simpleTexStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}

TextStyle simpleTextFieldSty() {
  return TextStyle(color: Color(0xFFA5D6A7), fontSize: 16);
}

TextStyle simpleTextFieldStl() {
  return TextStyle(color: Color(0xFF616161), fontSize: 15);
}
