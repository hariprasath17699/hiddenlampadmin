

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Reels/View/AddReels.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../Utils/matUtils.dart';
import 'dart:html' as html;
FirebaseStorage _storage = FirebaseStorage.instance;
class uploademployeeimagetofirebase{
  static Future<dynamic> uploadImage(BuildContext context,String folder) async {
    try{
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement()..click();
      uploadInput.onChange.listen((event)async {
        final file = uploadInput.files!.first;
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);
        await reader.onLoad.first;
        final imagebyte = reader.result as Uint8List;
        final fileName = file.name;
        MyUtils.showCircularProgress(context);
        final url = await FirebaseStorage.instance.ref('$folder/$fileName').putData(imagebyte! as Uint8List);
        MyUtils.hideCircularProgress(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('File uploaded successfully')));
        final dounloadUrl =  await FirebaseStorage.instance.ref('$folder/$fileName').getDownloadURL();
        Constants.employeeUrl = dounloadUrl;
      }
      );
    } catch (error) {
      print('Error uploading image: $error');
    }
  }


}
