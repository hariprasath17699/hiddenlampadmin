import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/AddProject/Controller/AddProjectController.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hiddenlampadmin/Widgets/projectUploadImage.dart';
import '../../Dashboard/View/Dashboard.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextInput.dart';
import '../../Widgets/Drawer.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  TextEditingController projectTitle = TextEditingController();
  TextEditingController authorName = TextEditingController();
  TextEditingController projectDescription = TextEditingController();
  TextEditingController projectId = TextEditingController();
  DateTime Date = DateTime.now();

  var projectimage;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != Date) {
      setState(() {
        Date = picked;
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
                      child: Text("Add Project",style: TextStyle(
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
                            child: CustomTextInput(maxLines: 1,textController: projectTitle, hintText: "Project Title",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: authorName, hintText: "Author Name",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 4,textController:projectDescription , hintText: "Project Description",onsecuretext: false,readOnly: false,onChanged: (){
        
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
                            child:  ElevatedButton(
                              onPressed: () => _selectDate(context),
                              child: Text("${Date.day.toString()}/${Date.month.toString()}/${Date.year.toString()}"),
                            ),),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: projectId, hintText: "Project Id",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        GestureDetector(
                          onTap: ()async{
                            projectimage = uploadprojectimagetofirebase.uploadImage(context,"projects");
                          },
                          child: Container(
                              width: responsivedropdownSize,
                              padding: EdgeInsets.only(left: 30),
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child:const Text(
                                  "Upload Project Image(jpeg,png,mp4,mov)",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ),
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
        AddProjectController.addProjectController(projectTitle.text, authorName.text, projectDescription.text, Date, projectId.text, context);
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
