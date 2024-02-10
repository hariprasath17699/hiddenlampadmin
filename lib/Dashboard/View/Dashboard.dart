import 'package:flutter/material.dart';

import '../../Assignment/View/Assignment.dart';
import '../../StudentDetails/View/StudentDetails.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/Drawer.dart';
import '../../Widgets/TextIcon.dart';
import '../../Widgets/welcometext.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // Adjust the height as needed
        child: CustomAppBar(),
      ),
drawer: MyDrawer(),

    body:  LayoutBuilder(
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


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Assignment()));
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => StudentDetails()));
            },
            child: Container(
                child: TextIcon(
                  icon: "student.png",
                  text: 'Student Details',
                  iconSize: responsiveIconSize,
                  textSize: responsivetextSize,
                  color: Colors.grey,
                )),
          ),
          GestureDetector(
            onTap: (){

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

            },
            child: Container(
                child: TextIcon(
                  icon: "reel.png",
                  text: 'Reels',
                  iconSize: responsiveIconSize,
                  textSize: responsivetextSize,
                  color: Colors.grey,
                )),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(
                child: TextIcon(
                  icon: "query.png",
                  text: 'Queries',
                  iconSize: responsiveIconSize,
                  textSize: responsivetextSize,
                  color: Colors.grey,
                )),
          ),
        ],
      ),
    ],
    ),
    );
  }));


  }


}

