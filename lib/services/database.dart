import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    Firestore.instance.collection("patient").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("patient")
        .where("email", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  getUsers() async {
    return await Firestore.instance.collection("patient").snapshots();
  }

  getUsersInfo() async {
    return Firestore.instance
        .collection("patient")
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  searchByName(String searchField) {
    return Firestore.instance
        .collection("patient")
        .where('name', isEqualTo: searchField)
        .getDocuments();
  }

  //-------------Programmes-------------------------------//////////
  getprogrammes() async {
    return await Firestore.instance.collection("programmes").snapshots();
  }

  Future<void> addprogrammeinfo(programmeData) async {
    Firestore.instance
        .collection("programmes")
        .add(programmeData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addexercicesToProg(programmeData, String programmesId) async {
    Firestore.instance
        .collection("programmes")
        .document(programmesId)
        .collection("exercices")
        .add(programmeData)
        .catchError((e) {
      print(e.toString());
    });
  }

/////------------Exercices---------------
  getexercices() async {
    return await Firestore.instance.collection("exercice").snapshots();
  }

  Future<void> addexercicesInfo(exoData) async {
    Firestore.instance.collection("exercice").add(exoData).catchError((e) {
      print(e.toString());
    });
  }

  getexercicesEtirement() async {
    return await Firestore.instance
        .collection("exercice")
        .where('categorie', isEqualTo: "etirements")
        .snapshots();
  }

  getexercicesSpecifiques() async {
    return await Firestore.instance
        .collection("exercice")
        .where('categorie', isEqualTo: "specifiques")
        .snapshots();
  }
}
