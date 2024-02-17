import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Notice/Controller/AddNoticesController.dart';
import 'package:hiddenlampadmin/Widgets/CustomTextInput.dart';

import '../../Widgets/Appbar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Drawer.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({super.key});

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {
  TextEditingController noticeTitle = TextEditingController();
  TextEditingController Description = TextEditingController();
  DateTime Date = DateTime.now();
  DateTime From = DateTime.now();
  DateTime To = DateTime.now();
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
                      child: Text("Add Notice(For employee only)",style: TextStyle(
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
                            child: CustomTextInput(maxLines: 1,textController: noticeTitle, hintText: "Notice Title",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child:  Container(
                              width: responsivedropdownSize,
                              padding: EdgeInsets.only(left: 30),
                              child:  ElevatedButton(
                                onPressed: () => _selectDate(context,From),
                                child: Text("${Date.day.toString()}/${Date.month.toString()}/${Date.year.toString()}"),
                              ),),),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child:  Container(
                              width: responsivedropdownSize,
                              padding: EdgeInsets.only(left: 30),
                              child:  ElevatedButton(
                                onPressed: () => _selectDate(context,To),
                                child: Text("${Date.day.toString()}/${Date.month.toString()}/${Date.year.toString()}"),
                              ),),),
        
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child: CustomTextInput(maxLines: 4,textController:Description , hintText: "Description",onsecuretext: false,readOnly: false,onChanged: (){
        
                            },)),
                        Container(
                            width: responsivedropdownSize,
                            padding: EdgeInsets.only(left: 30),
                            child:  Container(
                              width: responsivedropdownSize,
                              padding: EdgeInsets.only(left: 30),
                              child:  ElevatedButton(
                                onPressed: () => _selectDate(context,Date),
                                child: Text("${Date.day.toString()}/${Date.month.toString()}/${Date.year.toString()}"),
                              ),),),
                      ],
                    ),
                    SizedBox(height: 100,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicRoundedButton(buttonText: "Clear",textColor: Colors.white,borderRadius: 30,onTap: (){
        noticeTitle.clear();
        Description.clear();
                        },),
                        SizedBox(width: 20,),
                        NeumorphicRoundedButton(buttonText: "ADD",textColor: Colors.white,borderRadius: 30,onTap: (){
        AddNoticesController.addNoticesController(noticeTitle.text, From, To, Description.text, Date, context);
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
