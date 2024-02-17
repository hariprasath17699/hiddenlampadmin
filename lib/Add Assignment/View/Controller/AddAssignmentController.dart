

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddAssignmentController{
static Future<void> addAssignment(String assignmentName,String uploadURL,String Description, String assignmentId,String fromDate,String toDate,BuildContext context) {
  CollectionReference users = FirebaseFirestore.instance.collection('Assignments');
  return users
      .add({
"AssignmentUrl":uploadURL,
    "assignmentName":assignmentName,
    "discription":Description,
    "AssignmentId":assignmentId,
    "fromDate":fromDate,
    "endDate":toDate
  })
      .then((value) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Success'),
        content: Text("Assignment Added"),
      )
  ))
      .catchError((error) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Failure'),
        content: Text("Assignment Not Added $error"),
      )
  ));
}
}
