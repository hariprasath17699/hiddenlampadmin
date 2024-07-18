

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants.dart';


class QueriesController{
  static Future<void> queriesController(String text,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('messages');
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return users
        .add({
      "type":Constants.admin ? "admin": "employee",
      "sender":Constants.admin ? "admin":_auth.currentUser!.email,
      "text":text,
    });
  }
}
