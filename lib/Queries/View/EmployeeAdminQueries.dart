import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Notice/Controller/AddNoticesController.dart';
import 'package:hiddenlampadmin/EmployeeAppBar.dart';
import 'package:hiddenlampadmin/EmployeeDrawer.dart';
import 'package:hiddenlampadmin/Queries/Controller/QueriesController.dart';
import 'package:hiddenlampadmin/Widgets/CustomTextInput.dart';

import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Drawer.dart';
import '../Controller/Chat.dart';
import '../Controller/EmployeeChatList.dart';

class EmployeeAdminQueries extends StatefulWidget {
  const EmployeeAdminQueries({super.key});

  @override
  State<EmployeeAdminQueries> createState() => _EmployeeAdminQueriesState();
}

class _EmployeeAdminQueriesState extends State<EmployeeAdminQueries> {
  TextEditingController text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // Adjust the height as needed
        child: EmployeeCustomAppBar(),
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

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Text("Queries",style: TextStyle(
                    fontSize: responsiveIconSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                ),
                EmployeeChatList(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10,left: 10,right: 10,top: 10),
                      child: CustomTextInput(textController: text, hintText: 'Enter message to admin', maxLines: 3,onsecuretext: false,onChanged: (){

                      }, readOnly: false,),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 40,top: 20),
                    child:  IconButton(icon:Icon( Icons.send),onPressed: (){
                      QueriesController.queriesController(text.text, context);
                      text.clear();
                    },))
              ],
            );
          }),
    );
  }


}
