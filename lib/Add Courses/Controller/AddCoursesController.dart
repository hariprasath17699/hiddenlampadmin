import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';

class AddCoursesController{
  static Future<void> addCoursesController(String courseName,String courseId,String courseDuration,String description,String noofEpisodes,String authorName,BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Courses');
    return users
        .add({
      "Course Name":courseName,
      "Course Id":courseId,
      "Course Duration":courseDuration,
      "description":description,
      "noofEpisodes":noofEpisodes,
      "authorName":authorName,
      "pdf": Constants.coursepdfurl,
      "image":Constants.courseurl
    })
        .then((value) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Success'),
          content: Text("Course Added"),
        )
    ))
        .catchError((error) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Failure'),
          content: Text("Course Not Added $error"),
        )
    ));

  }
}
