import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';

class AddSchoolDetailsController{
  static Future<void> addSchoolController(String schoolName,String schooltype,String typeofeducation,String emailId,String address,String contactno,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('SchoolDetails');
    return users
        .add({
      "SchoolName":schoolName,
      "schoolType":schooltype,
      "typeofeducation":typeofeducation,
      "emailId":emailId,
      "address":address,
      "contact number":contactno,
      "image":Constants.schoolUrl
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("School Details Added"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("School Details Not Added $error"),
        )
    ));

  }
}
