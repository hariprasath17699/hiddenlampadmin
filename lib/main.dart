
import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Auth/View/Login.dart';
import 'Dashboard/View/Dashboard.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyB4ITG3zJJ7jODRBq5AojVv7BrohpqxOgg", appId: "1:959041941334:web:2dab59f54a22bae57cf0f7", messagingSenderId: "G-0XKXXM9KH8", projectId: "hiddenlamp",storageBucket: "gs://hiddenlamp.appspot.com")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _auth.currentUser != null ?Dashboard()  : Login(),
    );
  }
}