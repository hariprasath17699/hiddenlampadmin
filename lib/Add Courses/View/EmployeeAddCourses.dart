import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Courses/Controller/AddCoursesController.dart';
import 'package:hiddenlampadmin/EmployeeAppBar.dart';
import 'package:hiddenlampadmin/EmployeeDrawer.dart';
import 'package:hiddenlampadmin/Widgets/CustomTextInput.dart';
import 'package:hiddenlampadmin/Add Courses/UploadCourseImage.dart';
import '../../Dashboard/View/Dashboard.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Drawer.dart';
import '../uploadpdfcourse.dart';

class EmployeeAddCourses extends StatefulWidget {
  const EmployeeAddCourses({super.key});

  @override
  State<EmployeeAddCourses> createState() => _EmployeeAddCoursesState();
}

class _EmployeeAddCoursesState extends State<EmployeeAddCourses> {
  TextEditingController courseName = TextEditingController();
  TextEditingController courseId = TextEditingController();
  TextEditingController courseDuration = TextEditingController();
  TextEditingController Description = TextEditingController();
  TextEditingController authorName = TextEditingController();
  List<String> totalNoOfEpisodesoptions = <String>['select No Of Episodes','5', '10','15'];
  String  totalNoOfEpisodesdropdownValue = 'select No Of Episodes';
  var itemimage;
  var itempdf;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // Adjust the height as needed
        child: EmployeeCustomAppBar(),
      ),
      drawer: MyEmployeeDrawer(),
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
                      child: Text("Add Courses",style: TextStyle(
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
                            padding: EdgeInsets.only(left: 30,right: 30),
                            child: CustomTextInput(maxLines: 1,textController: courseName, hintText: "Course Name",onsecuretext: false,readOnly: false,onChanged: (){

                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30,right: 30),
                            child: CustomTextInput(maxLines: 1,textController: courseId, hintText: "Course Id",onsecuretext: false,readOnly: false,onChanged: (){

                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30,right: 30),
                            child: CustomTextInput(maxLines: 1,textController: courseDuration, hintText: "Course Duration",onsecuretext: false,readOnly: false,onChanged: (){

                            },)),

                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30,right: 30),
                            child: CustomTextInput(maxLines: 1,textController: Description, hintText: "Description",onsecuretext: false,readOnly: false,onChanged: (){

                            },)),
                        Flexible(
                          child: Container(
                            width: responsivedropdownSize,
                            decoration: BoxDecoration(
                                color: Colors.black, borderRadius: BorderRadius.circular(16)),
                            child: DropdownButton<String>(
                              value: totalNoOfEpisodesdropdownValue,
                              onChanged: (String? value) {
                                setState(() {
                                  totalNoOfEpisodesdropdownValue = value!;
                                });
                              },
                              underline: const SizedBox(),
                              isExpanded: true,
                              style: const TextStyle(color: Colors.white),
                              dropdownColor: Colors.black,
                              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                              selectedItemBuilder: (BuildContext context) {
                                return totalNoOfEpisodesoptions.map((String value) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      totalNoOfEpisodesdropdownValue,
                                    ),
                                  );
                                }).toList();
                              },
                              items: totalNoOfEpisodesoptions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController:authorName , hintText: "Author Name",onsecuretext: false,readOnly: false,onChanged: (){

                            },)),

                      ],
                    ),
                    SizedBox(height: 100,),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            itempdf =  uploadcoursepdftofirebase.uploadImage(context, "AllCourses");
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
                                  "Upload Pdf",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: (){
                            itemimage = uploadcourseimagetofirebase.uploadImage(context,"images");
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
                                  "Upload Video(mp4,mov)",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                        ),],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicRoundedButton(buttonText: "Clear",textColor: Colors.white,borderRadius: 30,onTap: (){
                          courseName.clear();
                          courseId.clear();
                          courseDuration.clear();
                          Description.clear();
                          authorName.clear();
                        },),
                        SizedBox(width: 20,),
                        NeumorphicRoundedButton(buttonText: "ADD",textColor: Colors.white,borderRadius: 30,onTap: (){
                          AddCoursesController.addCoursesController(courseName.text, courseId.text, courseDuration.text, Description.text, totalNoOfEpisodesdropdownValue, authorName.text, context);
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
