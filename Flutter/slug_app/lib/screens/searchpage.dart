import 'package:flutter/material.dart';
import '../components/search.dart';

class SearchPage extends StatelessWidget {
  static const String _title = 'Search';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Search(),
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.blueGrey[50],
      ),
    );
  }
}
