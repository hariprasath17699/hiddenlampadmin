import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';

class AddNoticesController{
  static Future<void> addNoticesController(String noticeName,DateTime from,DateTime to,String description,DateTime date,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Notices');
    return users
        .add({
      "Notice Title":noticeName,
      "From":from,
      "To":to,
      "description":description,
      "Date":date,
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("Notice Added"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("Notice Not Added $error"),
        )
    ));

  }
}
