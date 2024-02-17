import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Assignment/View/AddAssignment.dart';
import 'package:hiddenlampadmin/Add%20Courses/View/AddCourses.dart';
import 'package:hiddenlampadmin/Add%20Notice/View/AddNotice.dart';
import 'package:hiddenlampadmin/Add%20Reels/View/AddReels.dart';
import 'package:hiddenlampadmin/Add%20School%20Details/View/AddSchoolDetails.dart';
import 'package:hiddenlampadmin/AddEmployeeDetails/View/AddEmployeeDetails.dart';
import 'package:hiddenlampadmin/Auth/View/Login.dart';
import 'package:hiddenlampadmin/GetAllDataFromFirebase/Assignment/View/Assignment.dart';
import 'package:hiddenlampadmin/GetAllDataFromFirebase/Notices/View/Notices.dart';
import 'package:hiddenlampadmin/GetAllDataFromFirebase/Projects/View/Projects.dart';
import 'package:hiddenlampadmin/GetAllDataFromFirebase/SchoolDetails/View/SchoolDetails.dart';
import 'package:hiddenlampadmin/GetAllDataFromFirebase/StudentDetailsView/View/StudentDetailsView.dart';
import 'package:hiddenlampadmin/GetAllDataFromFirebase/UnlockCouses/View/UnlockCoursesView.dart';
import 'package:hiddenlampadmin/StudentDetails/View/StudentDetails.dart';

import '../AddItems/View/AddItems.dart';
import '../Dashboard/View/Dashboard.dart';
import '../GetAllDataFromFirebase/Courses/View/Courses.dart';
import '../GetAllDataFromFirebase/EmployeeDetails/View/EmployeeDetails.dart';
import '../GetAllDataFromFirebase/Items/View/Items.dart';
import '../GetAllDataFromFirebase/Reels/View/Reels.dart';
import 'CustomButton.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;

    final FirebaseAuth _auth = FirebaseAuth.instance;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          Container(
            padding: EdgeInsets.only(top: 30,left: 10),
            child: ListTile(
              title: Text('Dashboard'),
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,left: 10),
            child: ListTile(
              title: Text('Add Assignment'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAssignment()));

              },
            ),
          ),


          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Add Reels'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddReels()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Add Items'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddItems()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Add Notice'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotice()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Add School Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSchoolDetails()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Add Employee Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddEmployeeDetails()));
              },
            ),
          ),

          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Add Courses'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCourses()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Assignemnts'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Assignment()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Reels'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Reels()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Items'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Items()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Notices'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notices()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('School Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SchoolDetails()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Students Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDetailsView()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Employee Details'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeDetails()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Courses'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Courses()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Unlock Courses'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UnlockCourses()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Projects'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Projects()));
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 20),
            child: NeumorphicRoundedButton(buttonText: "LogOut",textColor: Colors.white,borderRadius: 30,onTap: (){
               _auth.signOut();
Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            },),
          ),

          // Add more ListTile widgets for additional buttons
        ],
      ),

    );
  }
}
