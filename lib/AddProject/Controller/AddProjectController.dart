import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';

class AddProjectController{
  static Future<void> addProjectController(String title,String name,String description,DateTime date,String projectId,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Projects');
    return users
        .add({
      "title":title,
      "name":name,
      "description":description,
      "date":date,
      "projectId":projectId,
      "image": Constants.projecturl
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("Project Added"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("Project Not Added $error"),
        )
    ));

  }
}
