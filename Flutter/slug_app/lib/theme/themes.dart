import 'package:flutter/material.dart';

// This file contains the themes for the flutter app!
// Keeping them all in one place will keep our app consistent
// To access from another folder just add the following line at the top of the .dart file
// "import 'theme/themes.dart';"

// Color scheme
// FROM: https://colorpalettes.net/color-palette-1944/

const MaterialColor primaryBlue = MaterialColor(
  0xFF203277,
  <int, Color>{
    50: Color(0xFF203217),
    100: Color(0xFF203227),
    200: Color(0xFF203237),
    300: Color(0xFF203247),
    400: Color(0xFF203257),
    500: Color(0xFF203267),
    600: Color(0xFF203297),
    700: Color(0xFF2032B7),
    800: Color(0xFF2032D7),
    900: Color(0xFF2032F7),
  },
);

// Color primaryColor = Color(0xFF203277);
Color secondColor = Color(0xFFE0D030);
Color accentOne = Color(0xFF6385BB);
Color accentTwo = Color(0xFF97BCD5);
Color accentThree = Color(0xFF4F4A4D);


// ThemeData
ThemeData getSlugTheme(){
  return new ThemeData(
    brightness: Brightness.dark,
    primarySwatch: primaryBlue,
    accentColor: secondColor,
    buttonColor: secondColor,
    scaffoldBackgroundColor: primaryBlue,
    unselectedWidgetColor: accentOne,
    selectedRowColor: accentThree,
    hoverColor: secondColor
);
}



