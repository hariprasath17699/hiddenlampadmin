import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Assignment/View/Controller/AddAssignmentController.dart';
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
  TextEditingController UploadURL = TextEditingController();
  DateTime FromDate = DateTime.now();
  DateTime ToDate = DateTime.now();

  var projectimage;
  Future<void> _selectDate(BuildContext context,DateTime initialDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != initialDate) {
      setState(() {
        initialDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // Adjust the height as needed
        child: CustomAppBar(),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: LayoutBuilder(
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
                            child: CustomTextInput(maxLines: 1,textController: assignmentName, hintText: "Assignment Name",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: assignmentId, hintText: "Assignment Id",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 4,textController:Descreption , hintText: "Description",onsecuretext: false,readOnly: false,onChanged: (){
        
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
                            child:  Container(
                              width: responsivedropdownSize,
                              padding: EdgeInsets.only(left: 30),
                              child:  ElevatedButton(
                                onPressed: () => _selectDate(context,FromDate),
                                child: Text("${FromDate.day.toString()}/${FromDate.month.toString()}/${FromDate.year.toString()}"),
                              ),),),
                        Column(
                          children: [
                            Text("From"),
                            Container(
                                width: responsivedropdownSize,
                                padding: EdgeInsets.only(left: 30),
                                child:  Container(
                                  width: responsivedropdownSize,
                                  padding: EdgeInsets.only(left: 30),
                                  child:  ElevatedButton(
                                    onPressed: () => _selectDate(context,ToDate),
                                    child: Text("${ToDate.day.toString()}/${ToDate.month.toString()}/${ToDate.year.toString()}"),
                                  ),),),
                          ],
                        ),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController:UploadURL , hintText: "Upload URL",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicRoundedButton(buttonText: "Clear",textColor: Colors.white,borderRadius: 30,onTap: (){
                           assignmentName.clear();
                           assignmentId.clear();
                           Descreption.clear();
                         UploadURL.clear();
                        },),
                        SizedBox(width: 20,),
                        NeumorphicRoundedButton(buttonText: "ADD",textColor: Colors.white,borderRadius: 30,onTap: (){
        AddAssignmentController.addAssignment(assignmentName.text,UploadURL.text,Descreption.text,assignmentId.text,FromDate,ToDate,context);
                        },),
                      ],
                    )
                     ],
                ),
        
              );
            }),
      ),
    );
  }
}
