import 'dart:html';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../theme/themes.dart';
import '../components/graph.dart';
import '../components/form.dart';

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
        elevation: 600,
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
            Text(''),  // spaceholder (new line)
          ],
        ),
      ),
    );
  }
}

class GetCommentSection extends StatelessWidget {
  final String documentId;
  GetCommentSection(this.documentId);

  final commentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CollectionReference comments = FirebaseFirestore.instance
        .collection('Fall2011_Perfect')
        .doc(documentId)
        .collection('prof_comments');
    return new Expanded(
        child: SizedBox(
            height: 600.0,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: comments
                            .orderBy("timestamp", descending: false)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          return new ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              return new ListTile(
                                  title: new Text(document.data()["comment"]));
                            }).toList(),
                          );
                        },
                      ),
                    ),
                    TextField(
                      controller: commentController,
                      decoration: InputDecoration(hintText: ' Add a comment!'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(32),
                      child: ElevatedButton(
                        onPressed: () {
                          var com = commentController.text;
                          commentController.clear();
                          comments.add({
                            "comment": com,
                            "timestamp": FieldValue.serverTimestamp()
                          });
                          //_findFirebaseComments();
                          //Text(fireComments.toString());
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ))));
  }
}

// Given the professors name as a string as it appears in the spreadsheets
// get the data from firestore and return a Column of the info
// If unsuccessful, display some kind of error message
class GetProfInfo extends StatelessWidget {
  final String documentId;
  final String collectionName = 'Fall2011_Perfect';
  GetProfInfo(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(collectionName);

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
            // appbar that contains back button
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,),
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
          chlds = chlds + pclasses + 
            [Padding(
              padding: EdgeInsets.symmetric(horizontal: 250, vertical: 2),
              child: Container(
              width: 600,
              child: AnonForm(collectionName, documentId),
            ),),] +
            [GetCommentSection(documentId)];
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

// Linking this data to anonymous form
// The following code creates the an_form subcollection in firestore.
//  final CollectionReference an_comments = FirebaseFirestore.instance
//       .collection('Fall2011_Perfect')
//       .doc(documentId)
//       .collection('an_form');
//       var an_com = an_commentController.text;                       // creates variable to temp store the text
//                   an_commentController.clear();
//                   an_form.add({                                  // an_comments : subcollection
//                     "value1": an_val1,
//                   });
