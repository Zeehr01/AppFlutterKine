import 'package:flutter/material.dart';
import 'package:kine_app/services/database.dart';
import '../widgets/widget.dart';

class PatientOverView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PatientOverView();
  }
}

class _PatientOverView extends State<PatientOverView> {
  Stream patientStream;
  DatabaseMethods datamethods = new DatabaseMethods();

  Widget patientList() {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          StreamBuilder(
              stream: patientStream,
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? Container()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return PatientTile(
                              nom: snapshot.data.documents[index].data["name"],
                              prenom:
                                  snapshot.data.documents[index].data["prenom"],
                              numero: snapshot
                                  .data.documents[index].data["numero"]);
                        },
                      );
              })
        ],
      ),
    ));
  }

  @override
  void initState() {
    datamethods.getUsers().then((value) {
      patientStream = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: appBarMain(context),
      body: patientList(),
    );
  }
}

class PatientTile extends StatelessWidget {
  final String nom, prenom, numero;
  PatientTile({
    @required this.nom,
    @required this.prenom,
    @required this.numero,
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
                        Text(nom),
                        SizedBox(height: 3),
                        Text(prenom),
                        SizedBox(height: 5),
                        Text(numero),
                        SizedBox(height: 10),
                        Icon(Icons.contact_mail, color: Colors.orangeAccent)
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
