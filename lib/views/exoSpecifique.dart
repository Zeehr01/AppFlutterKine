import 'package:flutter/material.dart';
import 'package:kine_app/services/database.dart';
import 'package:kine_app/widgets/AddButton.dart';
import '../widgets/widget.dart';

class ExoSpecifique extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExoSpecifique();
  }
}

class _ExoSpecifique extends State<ExoSpecifique> {
  Stream specifiqueStream;
  DatabaseMethods datamethods = new DatabaseMethods();

  Widget exerciceList() {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          StreamBuilder(
              stream: specifiqueStream,
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? Container()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return ExerciceTile(
                            nom: snapshot.data.documents[index].data["nom"],
                            categorie: snapshot
                                .data.documents[index].data["categorie"],
                            imageUrl:
                                snapshot.data.documents[index].data["source"],
                            description: snapshot
                                .data.documents[index].data["description"],
                            repetion: snapshot
                                .data.documents[index].data["repetition"],
                            serie: snapshot.data.documents[index].data["serie"],
                          );
                        },
                      );
              })
        ],
      ),
    ));
  }

  @override
  void initState() {
    datamethods.getexercicesSpecifiques().then((value) {
      specifiqueStream = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMainKineMesExercices(context),
      body: exerciceList(),
    );
  }
}

class ExerciceTile extends StatelessWidget {
  final String nom, categorie, imageUrl, description, serie, repetion;
  ExerciceTile(
      {@required this.nom,
      @required this.categorie,
      @required this.imageUrl,
      @required this.description,
      @required this.repetion,
      @required this.serie});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          //child:Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              margin: EdgeInsets.all(20),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: 120 + (MediaQuery.of(context).size.width / 2),
                height: 250,
              ),
            ),
            //AddButton(element: "AddExoToProg"),
            Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            "Nom exercice :",
                            style: simpleTextFieldSty(),
                          ),
                          SizedBox(width: 3),
                          Text(
                            nom,
                            style: simpleTextFieldStl(),
                          ),
                        ]),
                        SizedBox(height: 5),
                        Row(children: [
                          Text("Catégorie :", style: simpleTextFieldSty()),
                          SizedBox(width: 3),
                          Text(
                            categorie,
                            style: simpleTextFieldStl(),
                          ),
                        ]),
                        Row(children: [
                          Text("Série :", style: simpleTextFieldSty()),
                          SizedBox(width: 3),
                          Text(
                            serie,
                            style: simpleTextFieldStl(),
                          ),
                        ]),
                        Row(children: [
                          Text("Répétition :", style: simpleTextFieldSty()),
                          SizedBox(width: 3),
                          Text(
                            repetion,
                            style: simpleTextFieldStl(),
                          ),
                        ]),
                        Text("Description :", style: simpleTextFieldSty()),
                        SizedBox(height: 3),
                        Text(
                          description,
                          style: simpleTextFieldStl(),
                        ),
                      ]),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ])),
          ],
        ),
      ),
      // ),
    );
  }
}
