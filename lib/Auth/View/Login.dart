import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Auth/Controller/LoginController.dart';

import '../../Dashboard/View/Dashboard.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextInput.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
   var screenWidth = MediaQuery.of(context).size.width;
   var screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar:  AppBar(
        title:  Container(
          height: 100,
          width: 110,
          child: Image.asset(
            'hiddenlampicon.png',
          ),
        ),


      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(

                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: CustomTextInput(maxLines: 1,textController: username, hintText: "Email",onsecuretext: false,readOnly: false,onChanged: (){

                      },)))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(

                  child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child:CustomTextInput(maxLines: 1,textController: password, hintText: "Password",onsecuretext: true,readOnly: false,onChanged: (){

                      },)))),
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
width: 250,
                  height: screenHeight/15,
                  child: Padding(
                      padding: EdgeInsets.only(left: 50, right: 15, top: 5),
                      child: NeumorphicRoundedButton(buttonText: "Login",borderRadius: 20.0,textColor: Colors.white,onTap: (){
LoginController.Login(username.text,password.text,context);

                      },)))),
        ],
      )
    );
  }
}
