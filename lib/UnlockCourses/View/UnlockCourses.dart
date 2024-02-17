import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/UnlockCourses/Controller/UnlockCoursesController.dart';

import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextInput.dart';
import '../../Widgets/Drawer.dart';

class UnlockCourses extends StatefulWidget {
  const UnlockCourses({super.key});

  @override
  State<UnlockCourses> createState() => _UnlockCoursesState();
}

class _UnlockCoursesState extends State<UnlockCourses> {
  TextEditingController name = TextEditingController();
  List<String> selectclassoptions = <String>['Select Class','12', '11', '10', '9'];
  String selectclassdropdownValue = 'Select Class';
  List<String> sectionoptions = <String>['Select Section','A', 'B', 'C', 'D'];
  String sectiondropdownValue = 'Select Section';
  List<String> schooloptions = <String>['Select School','GKD', 'GSR', 'RNR', 'STT'];
  String schooldropdownValue = 'Select School';
  List<String> selectcourseoptions = <String>['Select Course','java', 'javascript', 'AWS', 'NodeJs'];
  String selectcoursedropdownValue = 'Select Course';
  List<String> selectepisodeoptions = <String>['Select Episode','1', '2', '3', '4'];
  String selectepisodedropdownValue = 'Select Episode';
  TextEditingController courseName = TextEditingController();
  TextEditingController courseId = TextEditingController();
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
              double basedropdownSize = 100.0;
              // Calculate the responsive icon size
              double responsiveIconSize = baseIconSize * responsiveFactor;
              double responsivedropdownSize = basedropdownSize * responsiveFactor;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 100),
                      child: Text("Unlock Courses",style: TextStyle(
                        fontSize: responsiveIconSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
                    ),
                    SizedBox(height: 300,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [  Container(

                        width: responsivedropdownSize,
                        decoration: BoxDecoration(
                            color: Colors.black, borderRadius: BorderRadius.circular(16)),
                        child: DropdownButton<String>(
                          value: selectclassdropdownValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectclassdropdownValue = value!;
                            });
                          },
                          underline: const SizedBox(),
                          isExpanded: true,
                          style: const TextStyle(color: Colors.white),
                          dropdownColor: Colors.black,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          selectedItemBuilder: (BuildContext context) {
                            return selectclassoptions.map((String value) {
                              return Align(
                                alignment: Alignment.center,
                                child: Text(
                                  selectclassdropdownValue,
                                ),
                              );
                            }).toList();
                          },
                          items: selectclassoptions.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                        SizedBox(width: responsiveIconSize,),
                        Container(

                          width: responsivedropdownSize,
                          decoration: BoxDecoration(
                              color: Colors.black, borderRadius: BorderRadius.circular(16)),
                          child: DropdownButton<String>(
                            value: sectiondropdownValue,
                            onChanged: (String? value) {
                              setState(() {
                                sectiondropdownValue = value!;
                              });
                            },
                            underline: const SizedBox(),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            selectedItemBuilder: (BuildContext context) {
                              return sectionoptions.map((String value) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    sectiondropdownValue,
                                  ),
                                );
                              }).toList();
                            },
                            items: sectionoptions.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ), SizedBox(width: responsiveIconSize,),
                        Container(

                          width: responsivedropdownSize,
                          decoration: BoxDecoration(
                              color: Colors.black, borderRadius: BorderRadius.circular(16)),
                          child: DropdownButton<String>(
                            value: schooldropdownValue,
                            onChanged: (String? value) {
                              setState(() {
                                schooldropdownValue = value!;
                              });
                            },
                            underline: const SizedBox(),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            selectedItemBuilder: (BuildContext context) {
                              return schooloptions.map((String value) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    schooldropdownValue,
                                  ),
                                );
                              }).toList();
                            },
                            items: schooloptions.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        )],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [  Container(

                        width: responsivedropdownSize,
                        decoration: BoxDecoration(
                            color: Colors.black, borderRadius: BorderRadius.circular(16)),
                        child: DropdownButton<String>(
                          value: selectcoursedropdownValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectcoursedropdownValue = value!;
                            });
                          },
                          underline: const SizedBox(),
                          isExpanded: true,
                          style: const TextStyle(color: Colors.white),
                          dropdownColor: Colors.black,
                          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                          selectedItemBuilder: (BuildContext context) {
                            return selectcourseoptions.map((String value) {
                              return Align(
                                alignment: Alignment.center,
                                child: Text(
                                  selectcoursedropdownValue,
                                ),
                              );
                            }).toList();
                          },
                          items: selectcourseoptions.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                        SizedBox(width: responsiveIconSize,),
                        Container(

                          width: responsivedropdownSize,
                          decoration: BoxDecoration(
                              color: Colors.black, borderRadius: BorderRadius.circular(16)),
                          child: DropdownButton<String>(
                            value: selectepisodedropdownValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectepisodedropdownValue = value!;
                              });
                            },
                            underline: const SizedBox(),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            selectedItemBuilder: (BuildContext context) {
                              return selectepisodeoptions.map((String value) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    selectepisodedropdownValue,
                                  ),
                                );
                              }).toList();
                            },
                            items: selectepisodeoptions.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ), SizedBox(width: responsiveIconSize,),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: courseId, hintText: "Course Id",onsecuretext: false,readOnly: false,onChanged: (){

                            },)),],
                    ),
                    SizedBox(height: 50,),
                    NeumorphicRoundedButton(buttonText: "Save",textColor: Colors.white,borderRadius: 10.0,onTap: (){
                      UnlockCoursesController.unlockCourseController(selectclassdropdownValue, sectiondropdownValue, schooldropdownValue, selectcoursedropdownValue, selectepisodedropdownValue, courseId.text, context);
                    }),  ],
                ),

              );
            })
    );
  }
}
