

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Constants.dart';

import '../../Dashboard/View/Dashboard.dart';
import '../../Dashboard/View/EmployeeDashboard.dart';

class LoginController{
static Future<void> Login(String username,String password,BuildContext context)async {

    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      if(_auth.currentUser!.email == "hiddenlampemployee@gmail.com"){
Constants.admin = false;
Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeDashboard()));

      }else{
        Constants.admin = true;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
      }

      // Navigate to the next screen or perform any desired action
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('User Not Found in DB'),
            content: Text(e.toString()),
          )
      );
      // Handle login errors
      print('Error: $e');
    }
  }
}

