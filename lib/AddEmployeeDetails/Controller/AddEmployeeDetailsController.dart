import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';

class AddEmployeeDetailsController{
  static Future<void> addEmployeeController(String firstname,String lastname,String gender,DateTime dob,String address,String contactno,String emailid,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('EmployeeDetails');
    return users
        .add({
      "firstname":firstname,
      "lastname":lastname,
      "gender":gender,
      "address":address,
      "contactno":contactno,
      "emailid":emailid,
      "image":Constants.employeeUrl
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("Employee Details Added"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("Employee Details Not Added $error"),
        )
    ));

  }
}
