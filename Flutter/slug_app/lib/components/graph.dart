// Trevor: I implemented this bar graph using the following website:
//    https://itnext.io/bar-charts-in-flutter-8a10c3592bbf

// Component to display a bar graph of grade distributions for a given
// professor and course combination (ex. Tantalo, CSE101);
// Letter grade counts (ex. 25 A's, 12 B's, etc.) should be passed in as a
// parameter when calling Graph(), like Graph(25, 12, 13, 4, 7)

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sandbox/theme/themes.dart';

class Graph extends StatefulWidget {
  final String title = "Graph";

  final int aCount, bCount, cCount, dCount, fCount;
  Graph(this.aCount, this.bCount, this.cCount, this.dCount, this.fCount);
  // read in parameters and pass them down further to GraphState() below

  @override
  GraphState createState() =>
      GraphState(aCount, bCount, cCount, dCount, fCount);
}

class Grades {
  final String grade; // A, B, C, D, F
  final int count; // ex. number of A+'s
  Grades(this.grade, this.count); // constructor for Grades class
}

class GraphState extends State<Graph> {
  List<charts.Series> seriesList;
  final int a, b, c, d, f; // totals for each grade
  GraphState(this.a, this.b, this.c, this.d, this.f);

  // get the corresponding grades for a specific class
  List<charts.Series<Grades, String>> _getGrades() {
    // array of grades to be passed in and displayed
    final gradesArray = [
      Grades("A", a),
      Grades("B", b),
      Grades("C", c),
      Grades("D", d),
      Grades("F", f),
    ];

    return [
      charts.Series<Grades, String>(
          id: 'Grades',
          domainFn: (Grades grades, _) => grades.grade,
          measureFn: (Grades grades, _) => grades.count,
          data: gradesArray,
          fillColorFn: (Grades grades, _) {
            return charts.MaterialPalette.teal.shadeDefault;
          })
    ];
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: barChart(),
        color: SlugThemes().accentTwo,
        constraints: BoxConstraints.tightForFinite(
          width: 200,
          height: 250,
        ),
      ),
    );
  }
}
