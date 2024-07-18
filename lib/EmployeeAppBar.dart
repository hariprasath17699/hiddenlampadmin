import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Dashboard/View/Dashboard.dart';
import 'package:hiddenlampadmin/Dashboard/View/EmployeeDashboard.dart';
import 'package:hiddenlampadmin/Notification/View/Notification.dart';
import 'package:hiddenlampadmin/Profile/View/EmployeeProfile.dart';
import 'package:hiddenlampadmin/Widgets/welcometext.dart';

import '../ContactUs/View/ContactUs.dart';
import '../Profile/View/Profile.dart';
import 'ContactUs/View/EmployeeContactUs.dart';
import 'Notification/View/EmployeeNotification.dart';
import 'Widgets/PrimaryContainer.dart';

class EmployeeCustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return AppBar(
      leadingWidth: 900,
      backgroundColor: Colors.white38,
      leading: Stack(

        children: [
          // screenWidth <1200?SizedBox(): ResponsiveSearchBox(),
          GestureDetector(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: Container(
                padding: EdgeInsets.only(left:20 ,top: 20),
                child: Icon(Icons.menu,size: 30,)),
          ),
          GestureDetector(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeDashboard()));
          },

            child: Container(
                padding: EdgeInsets.only(left: 60,top: 10),
                child: Image.asset("hiddenlampicon.png",fit: BoxFit.fill,)),
          ),],
      ),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [


            Container(
                padding: EdgeInsets.only(right:20 ,top: 10),
                child: AnimatedWelcomeText()),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeContactUs()));
              },
              child: Container(
                  padding: EdgeInsets.only(right:20,top: 10 ),
                  child: Icon(Icons.mail,size: 20,)),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeNotificationPage()));
              },
              child: Container(
                  padding: EdgeInsets.only(right: 20,top: 10),
                  child: Icon(Icons.notifications_active,size: 20,)),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeProfile()));
              },
              child: Container(
                padding: EdgeInsets.only(right: 20,top: 10),
                child: const CircleAvatar(
                  backgroundColor: Color(0xffE6E6E6),
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    color: Color(0xffCCCCCC),
                  ),
                ),
              ),
            ),


          ],

        ),

      ],

    );
  }
}

class ResponsiveSearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 400,top: 5),
      child:  PrimaryContainer(
        child: TextField(
          onChanged: (value) {},
          style: const TextStyle(fontSize: 16, color: Colors.white),
          textAlignVertical: TextAlignVertical.center,
          controller: TextEditingController(),
          decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 3),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'Search',
              suffixIcon: Container(
                width: 70,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0XF5E2B1B1),
                      Color(0XFF111111),
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(30)),
                child: const Icon(Icons.search, color: Color(0xFF222222)),
              ),
              hintStyle: const TextStyle(fontSize: 20, color: Colors.grey)),
        ),
      ),
    );
  }
}