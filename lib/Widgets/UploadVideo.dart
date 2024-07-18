

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Reels/View/AddReels.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html' as html;
import '../Utils/matUtils.dart';
FirebaseStorage _storage = FirebaseStorage.instance;
class uploadFiletofirebase{
 static Future<dynamic> uploadVideo(BuildContext context) async {
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

       final url = await FirebaseStorage.instance.ref('reels/$fileName')
           .putData(imagebyte!);

       MyUtils.hideCircularProgress(context);
       ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('File uploaded successfully')));

       final dounloadUrl = await FirebaseStorage.instance.ref('reels/$fileName')
           .getDownloadURL();
       Constants.reelurl = dounloadUrl;
     }
       );

    } catch (error) {
      print('Error uploading video: $error');
    }
  }


}
