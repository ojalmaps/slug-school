import 'package:flutter/material.dart';
import '../components/form.dart';

class FormPage extends StatelessWidget {
  static const String _title = 'Anonymous Form';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: AnonForm('Fall2011_Perfect', 'Abbink, Emily K.'),
      theme: ThemeData(
        backgroundColor: Colors.blueGrey[50],
      ),
    );
  }
}
