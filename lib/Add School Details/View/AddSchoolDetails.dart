import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20School%20Details/UploadSchoolImage.dart';
import 'package:hiddenlampadmin/Widgets/CustomTextInput.dart';

import '../../Dashboard/View/Dashboard.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Drawer.dart';
import '../Controller/AddSchoolDetailsController.dart';

class AddSchoolDetails extends StatefulWidget {
  const AddSchoolDetails({super.key});

  @override
  State<AddSchoolDetails> createState() => _AddSchoolDetailsState();
}

class _AddSchoolDetailsState extends State<AddSchoolDetails> {
  TextEditingController schoolName = TextEditingController();
  TextEditingController emailId = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  List<String> typeofschooloptions = <String>['select type of school','Matric', 'CBSE'];
  String  typeofschooldropdownValue = 'select type of school';
  List<String> levelofeducationoptions = <String>['select type of education','type1', 'type2','type3','type4','type5'];
  String  levelofeducationdropdownValue = 'select type of education';
  var schoolImage;
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
                      child: Text("Add School Details",style: TextStyle(
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
                            child: CustomTextInput(maxLines: 1,textController: schoolName, hintText: "School Name",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                          width: responsivedropdownSize,
                          decoration: BoxDecoration(
                              color: Colors.black, borderRadius: BorderRadius.circular(16)),
                          child: DropdownButton<String>(
                            value: typeofschooldropdownValue,
                            onChanged: (String? value) {
                              setState(() {
                                typeofschooldropdownValue = value!;
                              });
                            },
                            underline: const SizedBox(),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            selectedItemBuilder: (BuildContext context) {
                              return typeofschooloptions.map((String value) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    typeofschooldropdownValue,
                                  ),
                                );
                              }).toList();
                            },
                            items: typeofschooloptions.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Flexible(
                          child: Container(
                            width: responsivedropdownSize,
                            decoration: BoxDecoration(
                                color: Colors.black, borderRadius: BorderRadius.circular(16)),
                            child: DropdownButton<String>(
                              value: levelofeducationdropdownValue,
                              onChanged: (String? value) {
                                setState(() {
                                  levelofeducationdropdownValue = value!;
                                });
                              },
                              underline: const SizedBox(),
                              isExpanded: true,
                              style: const TextStyle(color: Colors.white),
                              dropdownColor: Colors.black,
                              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                              selectedItemBuilder: (BuildContext context) {
                                return levelofeducationoptions.map((String value) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      levelofeducationdropdownValue,
                                    ),
                                  );
                                }).toList();
                              },
                              items: levelofeducationoptions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: emailId, hintText: "Email ID",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 4,textController:Address , hintText: "Address",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: contactNo, hintText: "Contact Number",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      children: [GestureDetector(
                        onTap: (){
                          schoolImage = uploadschoolimagetofirebase.uploadImage(context,"images");
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
                                "Upload School Logo/Icon(jpeg,png,mp4,mov)",
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
                           schoolName.clear();
                           emailId.clear();
                           Address.clear();
                           contactNo.clear();
                        },),
                        SizedBox(width: 20,),
                        NeumorphicRoundedButton(buttonText: "ADD",textColor: Colors.white,borderRadius: 30,onTap: (){
                          AddSchoolDetailsController.addSchoolController(schoolName.text, typeofschooldropdownValue,levelofeducationdropdownValue, emailId.text, Address.text, contactNo.text, context);
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
