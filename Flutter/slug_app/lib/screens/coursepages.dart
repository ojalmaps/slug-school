import 'dart:html';
import 'dart:js';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../theme/themes.dart';
import 'coursepages.dart';
import 'package:path/path.dart';


// A class to store and organize data about UCSC courses
class Course{
    String colID; // Collection ID in firestore
    String docID; // Document ID in firestore
    String profName; // Professor name
    String title;
    Map <String, int> grades; // Map for grade dist


    Course(String col, String doc){
      this.colID = col;
      this.docID = doc;
  }

}


// Given the professors name as a string as it appears in the spreadsheets
// get the data from firestore and return a Column of the info
// If unsuccessful, display some kind of error message
class GetCourseInfo extends StatelessWidget {
  // A course as input
  final Course crs;
  

  GetCourseInfo(this.crs);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(crs.colID);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(crs.docID).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        // We are done and the connection was successful
        if (snapshot.connectionState == ConnectionState.done) {
          SlugThemes stheme = new SlugThemes();
          Map<String, dynamic> data = snapshot.data.data();
          crs.grades = new Map();
          crs.grades['A'] = data['A'] + data["A+"] + data['A-'];
          crs.grades['B'] = data['B'] + data["B+"] + data['B-'];
          crs.grades['C'] = data['C'] + data["C+"];
          crs.grades['FAIL'] = data['D'] + data['F'];
          crs.profName = data["Instructor"];
          crs.title = data["Course Title"];

          List<Widget> chlds = [
            Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(crs.title, style: stheme.largeText(),),
            ),

            // Placeholder for Image
            Icon(
              Icons.account_box_rounded, 
              size: 200.0
            ),

            // Course title and Catalog number
            Text("Professor: " + crs.profName, style: stheme.medText(),),
            Text("Subject-Catalog Number: " + crs.docID, style: stheme.medText(),),

            // // The grade dist
            Text("Grade Distribution", style: stheme.medText(),),
            Text(crs.grades['A'].toString() + " A's"),
            Text(crs.grades['B'].toString() + " B's"),
            Text(crs.grades['C'].toString() + " C's"),
            Text(crs.grades['FAIL'].toString() + " D's / F's"),
            
          ];
          return Column(children: chlds,);
        }
        // Default to loading
        return Text("loading");
      },
    );
  }
}


class CoursePage extends StatefulWidget{
    // Professor
    final Course crs;
    // Constructor
    CoursePage(this.crs);
    
    // Call abo
    @override
    _CoursePageState createState() => _CoursePageState(this.crs);

}

class _CoursePageState extends State<CoursePage> {
  Course crs;

  // Constructor
  _CoursePageState(this.crs);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child: GetCourseInfo(this.crs)),
    );
  }
}
