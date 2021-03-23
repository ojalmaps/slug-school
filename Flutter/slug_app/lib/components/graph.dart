// Trevor: I implemented this bar graph using the following website:
//    https://itnext.io/bar-charts-in-flutter-8a10c3592bbf

// Component to display a bar graph of grade distributions for a given
// professor and course combination (ex. Tantalo, CSE101)
//
// note: may need to later add in a third parameter to take in the specific
//       quarter that the course was taught in

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Graph extends StatefulWidget {
  Graph() : super();
  final String title = "Graph";

  @override
  GraphState createState() => GraphState();
}

class Grades {
  final String grade;  // A, B, C, D, F
  final int count;  // ex. number of A+'s
  Grades(this.grade, this.count);  // constructor for Grades class
}

class GraphState extends State<Graph> {
  List<charts.Series> seriesList;

  // get the corresponding grades for a specific class
  static List<charts.Series<Grades, String>> _getGrades() {
    final gradesArray = [
      Grades("A", 10), 
      Grades("B", 9), 
      Grades("C", 8), 
      Grades("D", 7), 
      Grades("F", 6), 
    ];

    return [charts.Series<Grades, String>(
      id: 'Grades',
      domainFn: (Grades grades, _) => grades.grade,
      measureFn: (Grades grades, _) => grades.count,
      data: gradesArray
    )];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _getGrades();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }

  
}
