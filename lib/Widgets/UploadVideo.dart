

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Add%20Reels/View/AddReels.dart';
import 'package:hiddenlampadmin/Constants/Constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Utils/matUtils.dart';
FirebaseStorage _storage = FirebaseStorage.instance;
class uploadFiletofirebase{
 static Future<dynamic> uploadVideo(BuildContext context) async {
   try{
   final video = await FilePicker.platform.pickFiles(
       type: FileType.any, allowMultiple: false);
   if (video == null) return;

   if (video != null && video.files.isNotEmpty) {
     final fileBytes = video.files.first.bytes;
     final fileName = video.files.first.name;

     MyUtils.showCircularProgress(context);

   final url = await FirebaseStorage.instance.ref('reels/$fileName').putData(fileBytes!);

     MyUtils.hideCircularProgress(context);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('File uploaded successfully')));

final dounloadUrl =  await FirebaseStorage.instance.ref('reels/$fileName').getDownloadURL();
Constants.reelurl = dounloadUrl;
    return dounloadUrl;
   }


    } catch (error) {
      print('Error uploading video: $error');
    }
  }


}
