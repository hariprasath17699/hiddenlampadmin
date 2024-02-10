import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Widgets/CustomTextInput.dart';

import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Drawer.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({super.key});

  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  TextEditingController assignmentName = TextEditingController();
  TextEditingController assignmentId = TextEditingController();
  TextEditingController Descreption = TextEditingController();
  TextEditingController fromDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController UploadURL = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // Adjust the height as needed
        child: CustomAppBar(),
      ),
      drawer: MyDrawer(),
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
                    child: Text("Add Assignment",style: TextStyle(
                      fontSize: responsiveIconSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                  ),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: responsivedropdownSize,
                          padding: EdgeInsets.only(left: 30),
                          child: CustomTextInput(maxLines: 1,textController: assignmentName, hintText: "Assignment Name",readOnly: false,onChanged: (){

                          },)),
                      Container(
                          width: responsivedropdownSize,
                          padding: EdgeInsets.only(left: 30),
                          child: CustomTextInput(maxLines: 1,textController: assignmentId, hintText: "Assignment Id",readOnly: false,onChanged: (){

                          },)),
                      Container(
                          width: responsivedropdownSize,
                          padding: EdgeInsets.only(left: 30),
                          child: CustomTextInput(maxLines: 4,textController:Descreption , hintText: "Description",readOnly: false,onChanged: (){

                          },)),
                    ],
                  ),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: responsivedropdownSize,
                          padding: EdgeInsets.only(left: 30),
                          child: CustomTextInput(maxLines: 1,textController: fromDate, hintText: "From Date",readOnly: false,onChanged: (){

                          },)),
                      Container(
                          width: responsivedropdownSize,
                          padding: EdgeInsets.only(left: 30),
                          child: CustomTextInput(maxLines: 1,textController: endDate, hintText: "End Date",readOnly: false,onChanged: (){

                          },)),
                      Container(
                          width: responsivedropdownSize,
                          padding: EdgeInsets.only(left: 30),
                          child: CustomTextInput(maxLines: 1,textController:UploadURL , hintText: "Upload URL",readOnly: false,onChanged: (){

                          },)),
                    ],
                  ),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeumorphicRoundedButton(buttonText: "Clear",textColor: Colors.white,borderRadius: 30,onTap: (){

                      },),
                      SizedBox(width: 20,),
                      NeumorphicRoundedButton(buttonText: "ADD",textColor: Colors.white,borderRadius: 30,onTap: (){

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