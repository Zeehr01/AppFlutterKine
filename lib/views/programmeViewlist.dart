import 'package:flutter/material.dart';
import 'package:kine_app/services/database.dart';
import '../widgets/widget.dart';

class ProgrammeViewList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgrammeViewList();
  }
}

class _ProgrammeViewList extends State<ProgrammeViewList> {
  Stream programmeStream;
  DatabaseMethods datamethods = new DatabaseMethods();

  Widget patientList() {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          StreamBuilder(
              stream: programmeStream,
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? Container()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return ProgrammeTile(
                              nom: snapshot.data.documents[index].data["nom"],
                              pathologie: snapshot.data.documents[index]
                                  .data["pathologie_cible"]);
                        },
                      );
              })
        ],
      ),
    ));
  }

  @override
  void initState() {
    datamethods.getprogrammes().then((value) {
      programmeStream = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMainKineMesProgrammes(context),
      body: patientList(),
    );
  }
}

class ProgrammeTile extends StatelessWidget {
  final String nom, pathologie;
  ProgrammeTile({
    @required this.nom,
    @required this.pathologie,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Nom du programme :"),
                        SizedBox(height: 3),
                        Text(nom),
                        SizedBox(height: 5),
                        Text("Pathologie ciblée :"),
                        SizedBox(height: 3),
                        Text(pathologie),
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
    );
  }
}
