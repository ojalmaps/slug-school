import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'profpages.dart';

// A class to store and organize data about UCSC courses
class Course{
    String title;
    String deptNum;
    List<int> gradeDist;

    Course(List<String> row, List<int> grades){
      this.deptNum = row[0];
      this.title = row[1];
      this.gradeDist = grades;
    }

    Scaffold display(){
      return Scaffold(
        body: Column(children: [
          Text(this.title, 
            style: TextStyle(fontSize: 36),
          ),
          Text(
            this.deptNum, 
            style: TextStyle(fontSize: 24),
          ),
          // Text("A's " + (gradeDist[0] + gradeDist[1] + gradeDist[2]).toString() ),
          // Text("B's " + (gradeDist[3] + gradeDist[4] + gradeDist[5]).toString()),
          // Text("C's " + gradeDist[6].toString())
        ],),
      );
    }
  
}



