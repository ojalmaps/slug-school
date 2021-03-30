import 'package:flutter/material.dart';
import 'package:sandbox/theme/themes.dart';
import '../components/search.dart';

class SearchPage extends StatelessWidget {
  static const String _title = 'Search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for a course or professor: ",
                style: SlugThemes().homePageButtomTheme(),
        ),
        backgroundColor: SlugThemes().accentOne,
        centerTitle: true,    
        ),
        
      body: Search(),
    );
  }
}
