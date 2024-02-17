

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class QueriesController{
  static Future<void> queriesController(String text,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('messages');
    return users
        .add({
      "type":"admin",
      "sender":"admin",
      "text":text,
    });
  }
}
