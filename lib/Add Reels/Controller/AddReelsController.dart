

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';


class AddReelsController{
  static Future<void> addReelDetails(String reelTitle,String reelCategory,String description,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Reels');
    return users
        .add({
      "Reel title":reelTitle,
      "Reel Category":reelCategory,
      "Description":description,
      "video":Constants.reelurl
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("Reel Added"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("Reel Not Added $error"),
        )
    ));
  }
}
