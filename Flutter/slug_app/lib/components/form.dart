// Trevor: I implemented the dropdown window for form input from the following documentation:
//        https://api.flutter.dev/flutter/material/DropdownButton-class.html

// Component to display an anonymous form within the website, without
// redirecting to another page in Flutter

import 'package:flutter/material.dart';


class AnonForm extends StatefulWidget {
  @override
  FormState createState() => FormState();
}

class FormState extends State<AnonForm> {
  List choices = ['5', '4', '3', '2', '1'];

  String difficulty = '3';
  String enjoyment = '3';
  String workload = '3';
  String preparedness = '3';
  String helpfulness = '3';
  
  final description = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          Container(
              height: 180,
              width: 750,
              child: Card(
                  elevation: 40,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 4,
                          child: Container(
                              height: 800,  // have to hardcode the height for since the container doesn't do it automatically??
                              padding: EdgeInsets.all(20),
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
                            height: 800,  // have to hardcode the height for since the container doesn't do it automatically??
                            padding: EdgeInsets.all(20),
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
                                          iconSize: 0,  // make the array smaller (not sure why it still shows though)
                                          underline: SizedBox(),  // make the underline invisible
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
                                              child: Text(choice, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
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
                                          iconSize: 0,  // make the array smaller (not sure why it still shows though)
                                          underline: SizedBox(),  // make the underline invisible
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
                                              child: Text(choice, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
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
                                          iconSize: 0,  // make the array smaller (not sure why it still shows though)
                                          underline: SizedBox(),  // make the underline invisible
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
                                              child: Text(choice, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
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
                                          iconSize: 0,  // make the array smaller (not sure why it still shows though)
                                          underline: SizedBox(),  // make the underline invisible
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
                                              child: Text(choice, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
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
                                          iconSize: 0,  // make the array smaller (not sure why it still shows though)
                                          underline: SizedBox(),  // make the underline invisible
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
                                              child: Text(choice, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
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
                                            constraints: BoxConstraints.expand(width: 1000),
                                            child: TextField(
                                              style: TextStyle(
                                                fontSize: 14,
                                                height: 2,
                                              ),
                                              controller: description,
                                            ),
                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                  Text(''),  // empty new line
                                  
                                  Container(
                                    width: 60,
                                    height: 16,
                                  
                                    child: ElevatedButton(
                                      
                                      onPressed: () {
                                        setState(() {
                                          // comments.add({
                                          //   "comment": com,
                                          //   "timestamp": FieldValue.serverTimestamp()
                                          // });

                                          // reset values
                                          difficulty = '3';
                                          enjoyment = '3';
                                          workload = '3';
                                          preparedness = '3';
                                          helpfulness = '3';
                                          description.clear(); 
                                        });
                                      },
                                      child: Text('Submit', style: TextStyle(fontSize: 10)),
                                    ),
                                  ),
                                ]
                              )
                            ),
                      
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
