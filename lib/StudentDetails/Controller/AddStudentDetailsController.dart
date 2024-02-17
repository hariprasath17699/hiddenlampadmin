

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddStudentDetailsController{
  static Future<void> addStudentDetails(String Class,String Section,String School,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('StudentDetails');
    return users
        .add({
      "Class":Class,
      "Section":Section,
      "School":School,
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("Student Added"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("Student Details Not Added $error"),
        )
    ));
  }
}
