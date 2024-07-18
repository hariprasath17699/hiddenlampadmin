import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Notice/Controller/AddNoticesController.dart';
import 'package:hiddenlampadmin/EmployeeDrawer.dart';
import 'package:hiddenlampadmin/Widgets/CustomTextInput.dart';

import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Drawer.dart';

class EmployeeContactUs extends StatefulWidget {
  const EmployeeContactUs({super.key});

  @override
  State<EmployeeContactUs> createState() => _EmployeeContactUsState();
}

class _EmployeeContactUsState extends State<EmployeeContactUs> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // Adjust the height as needed
        child: AppBar(),
      ),
      drawer: MyEmployeeDrawer(),
      body: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate a responsive factor based on screen width
            double responsiveFactor = constraints.maxWidth / 600.0;

            // Define the base icon size
            double baseIconSize = 15.0;
            double basedropdownSize = 200.0;
            // Calculate the responsive icon size
            double responsiveIconSize = baseIconSize * responsiveFactor;
            double responsivedropdownSize = basedropdownSize * responsiveFactor;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: Text("ContactUs",style: TextStyle(
                      fontSize: responsiveIconSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                  ),
                ],
              ),

            );
          }),
    );
  }


}