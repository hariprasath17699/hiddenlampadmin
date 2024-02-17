import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';

class UnlockCoursesController{
  static Future<void> unlockCourseController(String Class,String Section,String School,String Course,String Episode,String CourseId,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('UnlockCourses');
    return users
        .add({
      "Class":Class,
      "Section":Section,
      "School":School,
      "Course":Course,
      "Episode":Episode,
      "CourseId":CourseId,
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("Unlocked Course"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("Not Unlocked $error"),
        )
    ));

  }
}
