import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/StudentDetails/Controller/AddStudentDetailsController.dart';

import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextInput.dart';
import '../../Widgets/Drawer.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  TextEditingController name = TextEditingController();
  List<String> classoptions = <String>['Please select class','12', '11', '10', '9'];
  String classdropdownValue = 'Please select class';
  List<String> sectionoptions = <String>['Please select section','A', 'B', 'C', 'D'];
  String sectiondropdownValue = 'Please select section';
  List<String> schooloptions = <String>['Please select school','GKD', 'GSR', 'RNR', 'STT'];
  String schooldropdownValue = 'Please select school';
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
                    child: Text("Student Details",style: TextStyle(
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
            value: classdropdownValue,
            onChanged: (String? value) {
            setState(() {
            classdropdownValue = value!;
            });
            },
            underline: const SizedBox(),
            isExpanded: true,
            style: const TextStyle(color: Colors.white),
            dropdownColor: Colors.black,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            selectedItemBuilder: (BuildContext context) {
            return classoptions.map((String value) {
            return Align(
            alignment: Alignment.center,
            child: Text(
            classdropdownValue,
            ),
            );
            }).toList();
            },
            items: classoptions.map<DropdownMenuItem<String>>((String value) {
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
                  SizedBox(height: 50,),
                  NeumorphicRoundedButton(buttonText: "Save",textColor: Colors.white,borderRadius: 10.0,onTap: (){
                 AddStudentDetailsController.addStudentDetails(classdropdownValue, sectiondropdownValue, sectiondropdownValue,context);
                  }),  ],
              ),

            );
          })
    );
  }
}
