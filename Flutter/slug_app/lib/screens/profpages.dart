import 'dart:html';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../theme/themes.dart';
import 'package:load/load.dart';
import '../components/graph.dart';

// Future<bool> checkIfDocExists(String colID, String docId) async {
//   try {
//     // Get reference to Firestore collection
//     var collectionRef = FirebaseFirestore.instance.collection(colID);

//     var doc = await collectionRef.doc(docId).get();
//     return doc.exists;
//   } catch (e) {
//     throw e;
//   }
// }

// class ProfCourse extends StatefulWidget{
//   final String documentId;
//   final String collectionID;

//   ProfCourse(this.documentId, this.collectionID);

//   @override
//   State createState() => ProfCourseState(this.documentId, this.collectionID);

// }

// class ProfCourseState extends State<ProfCourse> {
//   final String documentId;
//   final String collectionID;
//   bool exists;

//   ProfCourseState(this.documentId, this.collectionID);

//   @override
//   void initState() async{
//     CollectionReference users = FirebaseFirestore.instance.collection(collectionID);
//     var doc = await users.doc(documentId).get();
//     this.exists = doc.exists;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection(collectionID);
//     if (!exists){
//       return Text("Doc does not exist");
//     }

//     // If the document does not exist in the collection then stop here before errors
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           SlugThemes stheme = new SlugThemes();
//           Map<String, dynamic> data = snapshot.data.data();
//           int numAs = data['A'] + data["A+"] + data['A-'];
//           int numBs = data['B'] + data["B+"] + data['B-'];
//           int numCs = data['C'] + data["C+"];
//           int fails = data['D'] + data['F'];
//           double passRate = (numAs + numBs) / (numAs + numBs + numCs + fails);
//           String dept = data["Subject-Catalog Number"].toString();
//           dept = "Department: " + dept.substring(0, dept.indexOf("-"));
//           // Data about a specific course here
//           return  Padding(
//               padding: EdgeInsets.all(48),
//               child: Card(
//                   borderOnForeground: true,
//                   color: stheme.accentTwo,
//                   elevation: 1000,
//                   shadowColor: Colors.black,
//                   child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         // Course title and Catalog number
//                         Text("Course Title: " + data["Course Title"], style: stheme.largeText(),),
//                         Text("Subject-Catalog Number: " + data["Subject-Catalog Number"], style: stheme.medText(),),
//                         Text("Grade Distribution", style: stheme.medText(),),
//                         Text("About " + (passRate * 100).toInt().toString() + "% of students passed with a B or better."),
//                         // Pass percentage graphic
//                         Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Container(
//                               child: Divider(
//                                 color: Colors.green,
//                                 thickness: 25,
//                                 height: 30,
//                                 ),
//                               width: passRate * 300
//                             ),
//                             Container(
//                               child: Divider(
//                                 color: Colors.red,
//                                 thickness: 25,
//                                 height: 30,
//                                 ),
//                               width: (1-passRate) * 300,
//                             ),],
//                         ),
//                         // The grade dist
//                         Text(numAs.toString() + " A's",),
//                         Text(numBs.toString() + " B's",),
//                         Text(numCs.toString() + " C's"),
//                         Text(data["D"].toString() + " Ds"),
//                         Text(data["F"].toString() + " Fs"),
//                         ],
//                     ),
//                 ),
//               );
//         }
//         return Text("loading");
//       },
//     );
//   }
// }

class CreateCourseWidg extends StatelessWidget {
  final List<dynamic> stats;

  CreateCourseWidg(this.stats);

  @override
  Widget build(BuildContext context) {
    SlugThemes stheme = new SlugThemes();
    int numAs = stats[2] + stats[3] + stats[3];
    int numBs = stats[5] + stats[6] + stats[7];
    int numCs = stats[8] + stats[9];
    int numDs = stats[10];
    int numFs = stats[11];
    int fails = stats[10] + stats[11];
    double passRate = (numAs + numBs) / (numAs + numBs + numCs + fails);
    return Padding(
      padding: EdgeInsets.all(24),
      child: Card(
        borderOnForeground: true,
        color: stheme.accentTwo,
        elevation: 1000,
        shadowColor: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Course title and Catalog number
            Text(
              "Course Title: " + stats[1],
              style: stheme.largeText(),
            ),
            Text(
              "Subject-Catalog Number: " + stats[0],
              style: stheme.medText(),
            ),
            Text(
              "Grade Distribution",
              style: stheme.medText(),
            ),
            Text("About " +
                (passRate * 100).toInt().toString() +
                "% of students passed with a B or better."),
            // Pass percentage graphic
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
            // // The grade dist
            // Text(numAs.toString() + " A's",),
            // Text(numBs.toString() + " B's",),
            // Text(numCs.toString() + " C's"),
            // Text(stats[10].toString() + " Ds"),
            // Text(stats[11].toString() + " Fs"),
            
            // Display grade distribution as a bar graph within container
            Container(
              height: 200,
              width: 150,
              child: Graph(numAs, numBs, numCs, numDs, numFs),
            ),
          ],
        ),
      ),
    );
  }
}

// Given the professors name as a string as it appears in the spreadsheets
// get the data from firestore and return a Column of the info
// If unsuccessful, display some kind of error message
class GetProfInfo extends StatelessWidget {
  final String documentId;

  GetProfInfo(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('Fall2011_Perfect');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          SlugThemes stheme = new SlugThemes();
          List<Widget> pclasses = [];
          String dept = "";
          Map<String, dynamic> data = snapshot.data.data();
          for (String d in data.keys) {
            dynamic curr = data[d];
            if (curr is String) {
              continue;
            } else if (curr is List<dynamic>) {
              if (dept.length == 0) dept = curr[0];
              pclasses.add(CreateCourseWidg(curr));
            }
          }
          dept = "Department: " + dept.substring(0, dept.indexOf("-"));
          List<Widget> chlds = [
            // Placeholder for Image
            Icon(Icons.account_circle, size: 300),
            // Professor name and Department
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Name: " + documentId,
                      style: stheme.largeText(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      dept,
                      style: stheme.largeText(),
                    ),
                  ),
                ],
              ),
            ),
            // Aesthetic divider
            Divider(
              height: 50,
              thickness: 10,
              indent: 65,
              endIndent: 65,
              color: stheme.accentOne,
            ),
          ];
          chlds = chlds + pclasses;
          return ListView(
            children: chlds,
          );
        }
        return Text("loading");
      },
    );
  }
}

class ProfPage extends StatefulWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: GetProfInfo(this.prof.name)),
    );
  }
}

// Class to represent a professor
class Professor {
  String name; // Name (Document ID from firestore)
  String colID; // Collection ID (Year and quarter of the data ex. "Fall2011")
  Image pic; // Image of professor to be displayed

  // A list with the course data, may not be used
  List<dynamic> courseInfo;

  Professor(String docID, String collectionID) {
    this.name = docID;
    this.colID = collectionID;
  }
}
