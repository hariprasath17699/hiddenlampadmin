import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Reels/Controller/AddReelsController.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';
import 'package:hiddenlampadmin/Dashboard/View/Dashboard.dart';

import '../../Utils/matUtils.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextInput.dart';
import '../../Widgets/Drawer.dart';
import '../../Widgets/UploadVideo.dart';

class AddReels extends StatefulWidget {
  const AddReels({super.key});

  @override
  State<AddReels> createState() => _AddReelsState();
}

class _AddReelsState extends State<AddReels> {
  TextEditingController reelTitle = TextEditingController();
  TextEditingController ReelDescreption = TextEditingController();
  List<String> reelcategoryoptions = <String>['Music', 'Dance',];
  String  reelcategorydropdownValue = 'Music';

  var reelVideo;
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
                      child: Text("Add Reels",style: TextStyle(
                        fontSize: responsiveIconSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 1,textController: reelTitle, hintText: "Reel Title",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        SizedBox(width: 50,),
                        Container(
        
                          width: responsivedropdownSize,
                          decoration: BoxDecoration(
                              color: Colors.black, borderRadius: BorderRadius.circular(16)),
                          child: DropdownButton<String>(
                            value: reelcategorydropdownValue,
                            onChanged: (String? value) {
                              setState(() {
                                reelcategorydropdownValue = value!;
                              });
                            },
                            underline: const SizedBox(),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            selectedItemBuilder: (BuildContext context) {
                              return reelcategoryoptions.map((String value) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    reelcategorydropdownValue,
                                  ),
                                );
                              }).toList();
                            },
                            items: reelcategoryoptions.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
        
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: responsivedropdownSize,
                            child: CustomTextInput(maxLines: 4,textController:ReelDescreption , hintText: "Reel Description",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        GestureDetector(
                          onTap: ()async{
                            reelVideo = uploadFiletofirebase.uploadVideo(context);
        
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
                                  "Upload Reel(jpeg,png,mp4,mov)",
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
                           reelTitle.clear();
                           ReelDescreption.clear();
                          reelcategoryoptions.clear();
                        },),
                        SizedBox(width: 20,),
                        NeumorphicRoundedButton(buttonText: "ADD",textColor: Colors.white,borderRadius: 30,onTap: (){
        AddReelsController.addReelDetails(reelTitle.text, reelcategorydropdownValue, ReelDescreption.text,context);
        
                        },),
                      ],
                    )
                  ],
                ),
        
              );
            }),
      ),
    );;
  }
}
