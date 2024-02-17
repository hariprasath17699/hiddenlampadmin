

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
class uploadschoolimagetofirebase{
  static Future<dynamic> uploadImage(BuildContext context,String folder) async {
    try{
      final image = await FilePicker.platform.pickFiles(
          type: FileType.any, allowMultiple: false);
      if (image == null) return;
      if (image != null && image.files.isNotEmpty) {
        final fileBytes = image.files.first.bytes;
        final fileName = image.files.first.name;
        MyUtils.showCircularProgress(context);
        final url = await FirebaseStorage.instance.ref('$folder/$fileName').putData(fileBytes!);
        MyUtils.hideCircularProgress(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('File uploaded successfully')));
        final dounloadUrl =  await FirebaseStorage.instance.ref('$folder/$fileName').getDownloadURL();
        Constants.schoolUrl = dounloadUrl;
        return dounloadUrl;
      }
    } catch (error) {
      print('Error uploading image: $error');
    }
  }


}
