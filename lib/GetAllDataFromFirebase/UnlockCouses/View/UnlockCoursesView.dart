import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/Drawer.dart';
import '../../../Widgets/GridView.dart';
class UnlockCourses extends StatefulWidget {
  @override
  _UnlockCoursesState createState() => _UnlockCoursesState();
}

class _UnlockCoursesState extends State<UnlockCourses> {
  late Future<List<DocumentSnapshot>> data;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<List<DocumentSnapshot>> fetchData() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('UnlockCourses').get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // Adjust the height as needed
        child: AppBar(),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<DocumentSnapshot>? documents = snapshot.data;

            return Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:screenWidth>800? 5:2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: documents!.length,
                itemBuilder: (context, index) {
                  // Customize this widget based on your data structure
                  return GridItemWidget(
                    assignemntname: documents[index].get('Course'),
                    description: documents[index].get('Episode'),
                    index: index,
                    collection: "UnlockCourses",
                    // Add more fields as needed
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}