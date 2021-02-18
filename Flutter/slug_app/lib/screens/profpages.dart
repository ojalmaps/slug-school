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
import 'package:excel/excel.dart';

// Professor names to test info getter
String test1 = "Abbink,Emily K.";
String test2 = 'Farkas,Donka F';
String test3 = 'Guevara,Daniel Edward';
String test4 = 'Zavaleta,Erika S';

// Given the professors name as a string as it appears in the spreadsheets
// get the data from firestore and return a Column of the info
class GetProfInfo extends StatelessWidget {
  final String documentId;

  GetProfInfo(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Fall2011');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          SlugThemes stheme = new SlugThemes();
          Map<String, dynamic> data = snapshot.data.data();
          int num_as = data['A'] + data["A+"] + data['A-'];
          int num_bs = data['B'] + data["B+"] + data['B-'];
          int num_cs = data['C'] + data["C+"];

          List<Widget> chlds = [
            Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(documentId, style: stheme.largeText(),),
            ),

            // Placeholder for Image
            Icon(
              Icons.account_box_rounded, 
              size: 200.0
            ),

            // Course title and Catalog number
            Text("Course Title: " + data["Course Title"], style: stheme.medText(),),
            Text("Subject-Catalog Number: " + data["Subject-Catalog Number"], style: stheme.medText(),),

            // The grade dist
            Text("Grade Distribution", style: stheme.medText(),),
            Text(num_as.toString() + " A's"),
            Text(num_bs.toString() + " B's"),
            Text(num_cs.toString() + " C's"),
            
          ];
          return Column(
            children: chlds,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            );
        }

        return Text("loading");
      },
    );
  }
}

class ProfPage extends StatefulWidget{
    // Professor
    final Professor prof;

    ProfPage(this.prof);

    // 
    @override
    _ProfPageState createState() => _ProfPageState(this.prof);

}

class _ProfPageState extends State<ProfPage> {
  Professor prof;

  
  // Constructor
  _ProfPageState(this.prof);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(child: GetProfInfo(test2)),
    );
  }
}

class Professor{
  String name;
  Image pic;
  List<String> info;
  List<int> grades;


  Professor(List<String> infrm, List<int> grds){
    this.name = infrm[0];
    this.info = infrm;
    this.grades = grds;
  }

  // (Placeholder) Return an average of the prof's ratings
  int getAverageRating(){
    return 1;
  }
}

