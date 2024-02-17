import 'package:flutter/material.dart';

class MyUtils {
  static void showCircularProgress(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16.0),
                Text('Loading...'),
              ],
            ),
          ),
        );
      },
    );
  }
  static void hideCircularProgress(BuildContext context) {
    Navigator.of(context).pop();
  }
}
