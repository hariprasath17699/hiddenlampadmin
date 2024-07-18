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

class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({super.key});

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }
  updateDetails(String username,String passwors){
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.currentUser!.updateEmail(username);
    _auth.currentUser!.updatePassword(passwors);
  }
  getData() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    username.text = _auth.currentUser!.email!;
  }
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
                    child: Text("Profile",style: TextStyle(
                      fontSize: responsiveIconSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                  ),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: responsivedropdownSize,
                          padding: EdgeInsets.only(left: 30),
                          child: CustomTextInput(maxLines: 1,textController: username, hintText: "Username",onsecuretext: false,readOnly: false,onChanged: (){

                          },)),
                      Container(
                          width: responsivedropdownSize,
                          padding: EdgeInsets.only(left: 30),
                          child: CustomTextInput(maxLines: 1,textController: password, hintText: "password",onsecuretext: false,readOnly: false,onChanged: (){

                          },)),

                    ],
                  ),

                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeumorphicRoundedButton(buttonText: "Clear",textColor: Colors.white,borderRadius: 30,onTap: (){

                        password.clear();

                      },),
                      SizedBox(width: 20,),
                      NeumorphicRoundedButton(buttonText: "Update",textColor: Colors.white,borderRadius: 30,onTap: (){
                        updateDetails(username.text,password.text);
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Done'),
                              content: Text("User Details Updated"),
                            )
                        );
                      },),
                    ],
                  )
                ],
              ),

            );
          }),
    );
  }


}
