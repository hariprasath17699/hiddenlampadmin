import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hiddenlampadmin/Dashboard/View/Dashboard.dart';
class GridItemWidget extends StatelessWidget {
  final String assignemntname;
  final String description;
final int index;
final String collection;
  // Add more parameters as needed

  GridItemWidget({
    required this.assignemntname,
    required this.description, required this.index,required this.collection
    // Add more parameters as needed
  });
  void deleteItemByIndex(int index) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collection).get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    if (index >= 0 && index < documents.length) {
      String documentId = documents[index].id;

      await FirebaseFirestore.instance.collection(collection).doc(documentId).delete();
      print('Item deleted with ID: $documentId');
    } else {
      print('Invalid index');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Add an Image or Icon here if desired
          SizedBox(height: 8.0),
          Text(
            assignemntname.toUpperCase(),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Container(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.only(top: 40),
                child: Icon(Icons.delete)),
            onTap: () {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Are you sure want to delete?'),
                    content: const SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Please choose yes if you want to delete'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          deleteItemByIndex(index);
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },

              );
            }
    ),
          // Add more Text or other widgets as needed
        ],
      ),
    );
  }
}