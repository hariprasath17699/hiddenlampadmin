import 'dart:html';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Assignment/View/AddAssignment.dart';
import 'package:hiddenlampadmin/Add%20Assignment/View/EmployeeAddAssignment.dart';
import 'package:hiddenlampadmin/Add%20Reels/View/AddReels.dart';
import 'package:hiddenlampadmin/EmployeeAppBar.dart';
import 'package:hiddenlampadmin/EmployeeDrawer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:js' as js;
import '../../AddProject/View/AddProject.dart';
import '../../AddProject/View/EmployeeAddProject.dart';
import '../../Assignment/View/Assignment.dart';
import '../../GetAllDataFromFirebase/UnlockCouses/View/EmployeeUnlockCourses.dart';
import '../../Queries/View/EmployeeAdminQueries.dart';
import '../../Queries/View/EmployeeQueries.dart';
import '../../Queries/View/Queries.dart';
import '../../StudentDetails/View/StudentDetails.dart';
import '../../UnlockCourses/View/EmployeeUnlockCourses.dart';
import '../../UnlockCourses/View/UnlockCourses.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/Drawer.dart';
import '../../Widgets/TextIcon.dart';
import '../../Widgets/welcometext.dart';

class EmployeeDashboard extends StatefulWidget {
  const EmployeeDashboard({super.key});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0), // Adjust the height as needed
          child: EmployeeCustomAppBar(),
        ),
        drawer: MyEmployeeDrawer(),

        body:  SingleChildScrollView(
          child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate a responsive factor based on screen width
                double responsiveFactor = constraints.maxWidth / 400.0;

                // Define the base icon size
                double baseIconSize = 50.0;
                double textSize = 10.0;
                // Calculate the responsive icon size
                double responsiveIconSize = baseIconSize * responsiveFactor;
                double responsivetextSize = textSize * responsiveFactor;
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(height: 170,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeAddAssignment()));
                            },
                            child: Container(
                                child: TextIcon(
                                  icon: "assignment.png",
                                  text: 'Assignment',
                                  iconSize: responsiveIconSize,
                                  textSize: responsivetextSize,
                                  color: Colors.grey,
                                )),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeAddProject()));
                            },
                            child: Container(
                                child: TextIcon(
                                  icon: "idea.png",
                                  text: 'Projects',
                                  iconSize: responsiveIconSize,
                                  textSize: responsivetextSize,
                                  color: Colors.grey,
                                )),
                          ),

                        ],
                      ),
                      SizedBox(height: 100,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeUnlockCourses()));
                            },
                            child: Container(
                                child: TextIcon(
                                  icon: "social.png",
                                  text: 'Unlock Courses',
                                  iconSize: responsiveIconSize,
                                  textSize: responsivetextSize,
                                  color: Colors.grey,
                                )),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeQueries()));
                            },
                            child: Container(
                                child: TextIcon(
                                  icon: "query.png",
                                  text: 'User Queries',
                                  iconSize: responsiveIconSize,
                                  textSize: responsivetextSize,
                                  color: Colors.grey,
                                )),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeAdminQueries()));
                            },
                            child: Container(
                                child: TextIcon(
                                  icon: "query.png",
                                  text: 'Admin Queries',
                                  iconSize: responsiveIconSize,
                                  textSize: responsivetextSize,
                                  color: Colors.grey,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 100,)
                    ],

                  ),
                );
              }),
        ));


  }


}

