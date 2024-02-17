import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';

class AdditemController{
  static Future<void> addItemController(String itemName,String itemNo,String quantity,String description,String category,String price,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('items');
    return users
        .add({
      "item Name":itemName,
      "item No":itemNo,
      "quantity":quantity,
      "description":description,
      "category":category,
      "price":price,
      "image": Constants.itemurl
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("Item Added"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("Item Not Added $error"),
        )
    ));

  }
}
