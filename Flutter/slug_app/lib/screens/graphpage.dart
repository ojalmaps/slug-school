import 'package:flutter/material.dart';
import '../components/graph.dart';

class GraphPage extends StatelessWidget {
  static const String _title = 'Bar Graph';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Graph(10, 29, 8, 17, 3),
      theme: ThemeData(
        backgroundColor: Colors.blueGrey[50],
      ),
    );
  }
}