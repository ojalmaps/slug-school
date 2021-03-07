import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

// This file contains the themes for the flutter app!
// Keeping them all in one place will keep our app consistent
// To access from another folder just add the following line at the top of the .dart file
// "import 'theme/themes.dart';"

// Color scheme
// FROM: https://colorpalettes.net/color-palette-1944/



// Color primaryColor = Color(0xFF203277);
Color secondColor = Color(0xFFE0D030);
Color accentOne = Color(0xFF6385BB);
Color accentTwo = Color(0xFF97BCD5);
Color accentThree = Color(0xFF4F4A4D);

class SlugThemes {
  MaterialColor primary = MaterialColor(
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
  Color secondary = Color(0xFFE0D030);
  Color accentOne = Color(0xFF6385BB);
  Color accentTwo = Color(0xFF97BCD5);
  Color accentThree = Color(0xFF4F4A4D);

  // Don't need a real constructor becuase values are static
  SlugThemes();
  
  // ThemeData
  ThemeData getSlugTheme(){
    return new ThemeData(
      brightness: Brightness.dark,
      primarySwatch: this.primary,
      accentColor: this.secondary,
      buttonColor: this.secondary,
      scaffoldBackgroundColor: this.primary,
      unselectedWidgetColor: this.accentOne,
      selectedRowColor: this.accentThree,
      hoverColor: this.secondary
    );
  }

  // Large text object
  TextStyle largeText(){
    return new TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 36,
      background: Paint()
        ..strokeWidth = 30
        ..color = this.secondary
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
      ,
      color: Colors.black
    );
  }
  // Medium text object
  TextStyle medText(){
    return new TextStyle(
      fontSize: 24,
      background: Paint()
        ..strokeWidth = 30
        ..color = this.accentTwo
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round
      ,
      color: Colors.black
    );
  }

}

