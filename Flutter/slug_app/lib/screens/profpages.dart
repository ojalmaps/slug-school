import 'dart:html';
import 'dart:js';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;
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
// If unsuccessful, display some kind of error message
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
          int numAs = data['A'] + data["A+"] + data['A-'];
          int numBs = data['B'] + data["B+"] + data['B-'];
          int numCs = data['C'] + data["C+"];
          int fails = data['D'] + data['F'];
          double passRate = (numAs + numBs) / (numAs + numBs + numCs + fails);
          String dept = data["Subject-Catalog Number"].toString();
          dept = "Department: " + dept.substring(0, dept.indexOf("-"));
          

          List<Widget> chlds = [
            // Placeholder for Image
                   Icon(
                      Icons.account_circle,
                      size: 300
                  ),
            Center( 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Name: " + documentId, style: stheme.largeText(),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(dept, style: stheme.largeText(),),
                  ),
                ],
              ),
            ),
            Divider(
              height: 50,
              thickness: 10,
              indent: 65,
              endIndent: 65,
              color: SlugThemes().accentOne,
            ),
            Card(
              borderOnForeground: true,
              color: SlugThemes().accentTwo,
              elevation: 1000,
              shadowColor: Colors.black,
              child: Column(
                children: [
                  // Course title and Catalog number
                  Text("Course Title: " + data["Course Title"], style: stheme.largeText(),),
                  Text("Subject-Catalog Number: " + data["Subject-Catalog Number"], style: stheme.medText(),),
                
                  // The grade dist
                  Text("Grade Distribution", style: stheme.medText(),),
                  // Text(passRate.toString()),
                  // Text("About " + (passRate * 100).toInt().toString() + "% of students passed with a B or better."),
                  // Row(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     Container(
                  //       child: Divider(
                  //         color: Colors.green,
                  //         thickness: 25,
                  //         height: 30,
                  //         ),
                  //       width: passRate * 300
                  //     ),
                  //     Container(
                  //       child: Divider(
                  //         color: Colors.red,
                  //         thickness: 25,
                  //         height: 30,
                  //         ),
                  //       width: (1-passRate) * 300,
                  //     ),],
                  // ),
                  
                  Text(numAs.toString() + " A's"),
                  Text(numBs.toString() + " B's"),
                  Text(numCs.toString() + " C's"),
                  Text(data["D"].toString() + " Ds"),
                  // Text(data["F"].toString() + " Fs"),
                ],
              ),
            ),
            
            

            
            
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

// Class to represent a professor
class Professor{
  String name;  // Name (Document ID from firestore)
  String colID; // Collection ID (Year and quarter of the data ex. "Fall2011")
  Image pic;    // Image of professor to be displayed

  // A list with the course data, may not be used
  List<dynamic> courseInfo; 

  Professor(String docID, String collectionID){
    this.name = docID;
    this.colID = collectionID;
  }
}
