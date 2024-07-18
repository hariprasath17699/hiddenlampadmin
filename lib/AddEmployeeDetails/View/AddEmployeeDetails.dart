import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/AddEmployeeDetails/Controller/AddEmployeeDetailsController.dart';
import 'package:hiddenlampadmin/AddEmployeeDetails/UploadEmployeeImage.dart';
import 'package:hiddenlampadmin/Widgets/CustomTextInput.dart';

import '../../Dashboard/View/Dashboard.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Drawer.dart';

class AddEmployeeDetails extends StatefulWidget {
  const AddEmployeeDetails({super.key});

  @override
  State<AddEmployeeDetails> createState() => _AddEmployeeDetailsState();
}

class _AddEmployeeDetailsState extends State<AddEmployeeDetails> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController emailId = TextEditingController();
  List<String> genderoptions = <String>['select gender','Male', 'Female','Other'];
  String  genderdropdownValue = 'select gender';
  DateTime dateofbirth = DateTime.now();
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
var itemimage;
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
                      child: Text("Add Employee Details",style: TextStyle(
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
                            child: CustomTextInput(maxLines: 1,textController: firstname, hintText: "First Name",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30,right: 30),
                            child: CustomTextInput(maxLines: 1,textController: lastName, hintText: "Last Name",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Flexible(
                          child: Container(
                            width: responsivedropdownSize,
                            decoration: BoxDecoration(
                                color: Colors.black, borderRadius: BorderRadius.circular(16)),
                            child: DropdownButton<String>(
                              value: genderdropdownValue,
                              onChanged: (String? value) {
                                setState(() {
                                  genderdropdownValue = value!;
                                });
                              },
                              underline: const SizedBox(),
                              isExpanded: true,
                              style: const TextStyle(color: Colors.white),
                              dropdownColor: Colors.black,
                              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                              selectedItemBuilder: (BuildContext context) {
                                return genderoptions.map((String value) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      genderdropdownValue,
                                    ),
                                  );
                                }).toList();
                              },
                              items: genderoptions.map<DropdownMenuItem<String>>((String value) {
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
                            child: ElevatedButton(
                              onPressed: () => _selectDate(context,dateofbirth),
                              child: Text("${dateofbirth.day.toString()}/${dateofbirth.month.toString()}/${dateofbirth.year.toString()}"),
                            ),),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 4,textController:address , hintText: "Address",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: contactNumber, hintText: "Contact Number",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                      ],
                    ),
                    SizedBox(height: 100,),
        
                    Row(
                      children: [
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: emailId, hintText: "Email Id",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        GestureDetector(
                        onTap: ()async{
                          itemimage = uploademployeeimagetofirebase.uploadImage(context,"images");
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
                                "Upload Photo(jpeg,png,mp4,mov)",
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
                           firstname.clear();
                           lastName.clear();
                           address.clear();
                           contactNumber.clear();
                           emailId.clear();
                        },),
                        SizedBox(width: 20,),
                        NeumorphicRoundedButton(buttonText: "ADD",textColor: Colors.white,borderRadius: 30,onTap: (){
        AddEmployeeDetailsController.addEmployeeController(firstname.text, lastName.text, genderdropdownValue, dateofbirth, address.text, contactNumber.text, emailId.text, context);
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
