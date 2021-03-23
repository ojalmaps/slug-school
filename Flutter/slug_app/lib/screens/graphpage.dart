import 'package:flutter/material.dart';
import '../components/graph.dart';
import '../theme/themes.dart';

class GraphPage extends StatelessWidget {
  static const String _title = 'Bar Graph';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Graph(),
      theme: SlugThemes().getSlugTheme(),
    );
  }
}