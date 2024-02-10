import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Assignment/View/AddAssignment.dart';
import 'package:hiddenlampadmin/Add%20Reels/View/AddReels.dart';

import '../Dashboard/View/Dashboard.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;

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
              title: Text('Assignments'),
              onTap: () {
                // Handle the Settings button tap
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,left: 15),
            child: ListTile(
              title: Text('Add Assignment'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAssignment()));

              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,left: 15),
            child: ListTile(
              title: Text('Delete Assignment'),
              onTap: () {
                // Handle the Settings button tap
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Students'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Reels'),
              onTap: (){
                Navigator.pop(context);
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
              title: Text('Courses'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Projects'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,top: 10),
            child: ListTile(
              title: Text('Queries'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
          // Add more ListTile widgets for additional buttons
        ],
      ),
    );
  }
}
