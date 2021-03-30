// Trevor: I implemented the dropdown window for form input from the following documentation:
//        https://api.flutter.dev/flutter/material/DropdownButton-class.html
//        https://www.youtube.com/watch?v=XuxpCYyrKoE

// Component to display an anonymous form within the website, without
// redirecting to another page in Flutter

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnonForm extends StatefulWidget {
  final String collection, doc;
  AnonForm(this.collection, this.doc);

  @override
  FormState createState() => FormState(collection, doc);
}

class FormState extends State<AnonForm> {
  final String collection, doc;
  FormState(this.collection, this.doc);

  List choices = ['5', '4', '3', '2', '1', ''];

  String difficulty = '';
  String enjoyment = '';
  String workload = '';
  String preparedness = '';
  String helpfulness = '';

  final description = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CollectionReference formData = FirebaseFirestore.instance
        .collection(collection)
        .doc(doc)
        .collection('form_data');

    return SizedBox(
      height: 250,
      width: 850,
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "  Rate Your Experience",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, color: Colors.teal),
          ),
          Padding(
            padding: EdgeInsets.all(12),
              child: Card(
                  elevation: 40,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              color: Colors.teal.shade100,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Please assign values as applicable:',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(''),
                                    Text(
                                      '5 - Excellent',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '4 - Good',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '3 - Average',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '2 - Below Average',
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '1 - Poor',
                                      textAlign: TextAlign.left,
                                    ),
                                  ]))),
                      Expanded(
                        flex: 6,
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            color: Colors.green.shade100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text(
                                        'How difficult is this course overall? (5 is hardest)  ',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        width: 31,
                                        height: 15,
                                        child: DropdownButton(
                                          iconSize:
                                              0, // make the array smaller (not sure why it still shows though)
                                          value: difficulty,
                                          onChanged: (newValue) {
                                            setState(() {
                                              difficulty = newValue;
                                            });
                                          },
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          items: choices.map((choice) {
                                            return DropdownMenuItem(
                                              value: choice,
                                              child: Text(choice,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'How much did you enjoy this course?  ',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        width: 31,
                                        height: 15,
                                        child: DropdownButton(
                                          iconSize:
                                              0, // make the array smaller (not sure why it still shows though)
                                          value: enjoyment,
                                          onChanged: (newValue) {
                                            setState(() {
                                              enjoyment = newValue;
                                            });
                                          },
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          items: choices.map((choice) {
                                            return DropdownMenuItem(
                                              value: choice,
                                              child: Text(choice,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'How heavy is the workload?  ',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        width: 31,
                                        height: 15,
                                        child: DropdownButton(
                                          iconSize:
                                              0, // make the array smaller (not sure why it still shows though)
                                          value: workload,
                                          onChanged: (newValue) {
                                            setState(() {
                                              workload = newValue;
                                            });
                                          },
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          items: choices.map((choice) {
                                            return DropdownMenuItem(
                                              value: choice,
                                              child: Text(choice,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'How knowledgeable/prepared is the professor?  ',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        width: 31,
                                        height: 15,
                                        child: DropdownButton(
                                          iconSize:
                                              0, // make the array smaller (not sure why it still shows though)
                                          value: preparedness,
                                          onChanged: (newValue) {
                                            setState(() {
                                              preparedness = newValue;
                                            });
                                          },
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          items: choices.map((choice) {
                                            return DropdownMenuItem(
                                              value: choice,
                                              child: Text(choice,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'How helpful is the professor?  ',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        width: 31,
                                        height: 15,
                                        child: DropdownButton(
                                          iconSize:
                                              0, // make the array smaller (not sure why it still shows though)
                                          value: helpfulness,
                                          onChanged: (newValue) {
                                            setState(() {
                                              helpfulness = newValue;
                                            });
                                          },
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                          items: choices.map((choice) {
                                            return DropdownMenuItem(
                                              value: choice,
                                              child: Text(choice,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Describe your experience:  ',
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                          width: 200,
                                          height: 15,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: ConstrainedBox(
                                              constraints:
                                                  BoxConstraints.expand(
                                                      width: 1000),
                                              child: TextField(
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  height: 2,
                                                ),
                                                controller: description,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                  Text(''), // empty new line

                                  Container(
                                    width: 60,
                                    height: 16,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (difficulty != '' &&
                                            enjoyment != '' &&
                                            workload != '' &&
                                            preparedness != '' &&
                                            helpfulness != '') {
                                          setState(() {
                                            int diffTotal =
                                                int.parse(difficulty);
                                            int enjoyTotal =
                                                int.parse(enjoyment);
                                            int workTotal = int.parse(workload);
                                            int prepTotal =
                                                int.parse(preparedness);
                                            int helpTotal =
                                                int.parse(helpfulness);

                                            print("diffTotal is " +
                                                diffTotal.toString());

                                            formData.doc('data').get().then(
                                                (DocumentSnapshot
                                                    documentSnapshot) {
                                              if (documentSnapshot.exists) {
                                                print("previous diff was " +
                                                    documentSnapshot
                                                        .data()["difficulty"]);
                                                diffTotal = diffTotal +
                                                    int.parse(documentSnapshot
                                                        .data()["difficulty"]);
                                                print(
                                                    "diffTotal is NOW updated to" +
                                                        diffTotal.toString());
                                                enjoyTotal = enjoyTotal +
                                                    int.parse(documentSnapshot
                                                        .data()["enjoyment"]);
                                                workTotal = workTotal +
                                                    int.parse(documentSnapshot
                                                        .data()["workload"]);
                                                prepTotal = prepTotal +
                                                    int.parse(
                                                        documentSnapshot.data()[
                                                            "preparedness"]);
                                                helpTotal = helpTotal +
                                                    int.parse(documentSnapshot
                                                        .data()["helpfulness"]);
                                              }
                                            });

                                            formData.doc("data").set({
                                              "difficulty": diffTotal,
                                              "enjoyment": enjoyTotal,
                                              "workload": workTotal,
                                              "preparedness": prepTotal,
                                              "helpfulness": helpTotal,
                                            });

                                            if (description.text != '') {
                                              formData.add({
                                                "description": description.text,
                                                "timestamp": FieldValue.serverTimestamp()
                                              });
                                            }

                                            // reset values
                                            difficulty = '';
                                            enjoyment = '';
                                            workload = '';
                                            preparedness = '';
                                            helpfulness = '';
                                            description.clear();
                                          });
                                        } else {
                                          print(
                                              "One or more of the fields are empty. Failed to submit.");
                                        }
                                      },
                                      child: Text('Submit',
                                          style: TextStyle(fontSize: 10)),
                                    ),
                                  ),
                                ])),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
