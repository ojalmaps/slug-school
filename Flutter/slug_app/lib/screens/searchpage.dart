import 'package:flutter/material.dart';
import '../components/search.dart';

class SearchPage extends StatelessWidget {
  static const String _title = 'Search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for a course or professor: ",
                style: TextStyle(fontSize: 20),
                ),
        centerTitle: true,    
        ),
        
      body: Search(),
    );
  }
}
