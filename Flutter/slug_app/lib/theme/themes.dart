import 'package:flutter/material.dart';

// This file contains the themes for the flutter app!
// Keeping them all in one place will keep our app consistent
// To access from another folder just add the following line at the top of the .dart file
// "import 'theme/themes.dart';"

ThemeData getSlugTheme(){
  return new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    accentColor: Colors.yellow,
    buttonColor: Colors.yellow,
    scaffoldBackgroundColor: Colors.blue,
    unselectedWidgetColor: Colors.yellow,
    selectedRowColor: Colors.yellow,
    hoverColor: Colors.yellow
);
}



