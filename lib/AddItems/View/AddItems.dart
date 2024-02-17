import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/AddItems/Controller/AddItemsController.dart';
import 'package:hiddenlampadmin/AddItems/UploadItemImage.dart';
import 'package:hiddenlampadmin/Widgets/CustomTextInput.dart';
import 'package:hiddenlampadmin/Widgets/projectUploadImage.dart';
import '../../Dashboard/View/Dashboard.dart';
import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Drawer.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemstState();
}

class _AddItemstState extends State<AddItems> {
  TextEditingController itemName = TextEditingController();
  TextEditingController itemNo = TextEditingController();
  TextEditingController itemDescription = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController itemPrice = TextEditingController();
  List<String> quantityoptions = <String>['select quantity','1', '2','3','4','5'];
  String  quantitydropdownValue = 'select quantity';
  List<String> categoryoptions = <String>['select category','category1', 'category2','category3','category4','category5'];
  String  categorydropdownValue = 'select category';
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
                      child: Text("Add Items",style: TextStyle(
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
                            child: CustomTextInput(maxLines: 1,textController: itemName, hintText: "Item Name",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30,right: 30),
                            child: CustomTextInput(maxLines: 1,textController: itemNo, hintText: "Item No",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                          width: responsivedropdownSize,
                          decoration: BoxDecoration(
                              color: Colors.black, borderRadius: BorderRadius.circular(16)),
                          child: DropdownButton<String>(
                            value: quantitydropdownValue,
                            onChanged: (String? value) {
                              setState(() {
                                quantitydropdownValue = value!;
                              });
                            },
                            underline: const SizedBox(),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            selectedItemBuilder: (BuildContext context) {
                              return quantityoptions.map((String value) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    quantitydropdownValue,
                                  ),
                                );
                              }).toList();
                            },
                            items: quantityoptions.map<DropdownMenuItem<String>>((String value) {
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30,right: 30),
                            child: CustomTextInput(maxLines: 4,textController:itemDescription , hintText: "Description",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                          width: responsivedropdownSize,
                          decoration: BoxDecoration(
                              color: Colors.black, borderRadius: BorderRadius.circular(16)),
                          child: DropdownButton<String>(
                            value: categorydropdownValue,
                            onChanged: (String? value) {
                              setState(() {
                                categorydropdownValue = value!;
                              });
                            },
                            underline: const SizedBox(),
                            isExpanded: true,
                            style: const TextStyle(color: Colors.white),
                            dropdownColor: Colors.black,
                            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                            selectedItemBuilder: (BuildContext context) {
                              return categoryoptions.map((String value) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    categorydropdownValue,
                                  ),
                                );
                              }).toList();
                            },
                            items: categoryoptions.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30,right: 30),
                            child: CustomTextInput(maxLines: 1,textController: itemPrice, hintText: "Item Price",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
        
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      children: [GestureDetector(
                        onTap: (){
                          itemimage = uploaditemimagetofirebase.uploadImage(context,"images");
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
                                "Upload item(jpeg,png,mp4,mov)",
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
                           itemName.clear();
                           itemNo.clear();
                           itemDescription.clear();
                           category.clear();
                           itemPrice.clear();
                        },),
                        SizedBox(width: 20,),
                        NeumorphicRoundedButton(buttonText: "ADD",textColor: Colors.white,borderRadius: 30,onTap: (){
        AdditemController.addItemController(itemName.text, itemNo.text,quantitydropdownValue, itemDescription.text, categorydropdownValue, itemPrice.text,context);
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
