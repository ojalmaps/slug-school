import 'dart:math';

import 'package:flutter/material.dart';

// This file contains the themes for the flutter app!
// Keeping them all in one place will keep our app consistent
// To access from another folder just add the following line at the top of the .dart file
// "import 'theme/themes.dart';"

// Color scheme
// FROM: https://colorpalettes.net/color-palette-1944/2

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
  ThemeData getSlugTheme() {
    return new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: this.primary,
        accentColor: this.secondary,
        buttonColor: this.secondary,
        scaffoldBackgroundColor: this.primary,
        unselectedWidgetColor: this.accentOne,
        selectedRowColor: this.accentThree,
        hoverColor: this.secondary,
        
        );
  }

  // Large text object
  TextStyle largeText() {
    return new TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 36,
        decoration: TextDecoration.underline,
        decorationColor: this.secondary,
        fontFamily: "OpenSans",
        color: Colors.white,
        shadows: [Shadow(color: Colors.black, offset: Offset(1.0, 1.0), blurRadius: 2.0)]
        );
  }

  // Medium text object
  TextStyle medText() {
    return new TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        // background: Paint()
        //   ..strokeWidth = 0 //changed these to try and fix formatting issues
        //   ..color = this.accentTwo
        //   ..style = PaintingStyle.stroke
        //   ..strokeJoin = StrokeJoin.miter,
        fontFamily: "OpenSans",
        color: Colors.white,
        shadows: [Shadow(color: Colors.black, offset: Offset(1.0, 1.0), blurRadius: 2.0)],
        );
  }
  
  // Small text object
  TextStyle smallText() {
    return new TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16,
        fontFamily: "OpenSans",
        color: Colors.white,
        // shadows: [Shadow(color: Colors.black, offset: Offset(1.0, 1.0), blurRadius: 2.0)],
        );
  }
  // Buttons on home page
  TextStyle homePageButtomTheme(){
    return TextStyle( color: Colors.white, fontSize: 20, fontFamily: "OpenSans");
  }

  // Search button text theme
  TextStyle searchTextTheme(){
    return TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: "OpenSans",
      decorationColor: accentTwo,
      decoration: TextDecoration.underline,
    );
  }

}

// Use custom painter for making background cirles
class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.fill;
    int x = 0;
    while (x < 10) {}

    canvas.drawCircle(
      center,
      size.width * 1 / 4,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// Custom paint the homepage
// https://www.youtube.com/watch?v=u96GgqHFy3c
class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      final height = size.height;
      final width = size.width;
      Paint paint = Paint();

      // Main Background
      Path mainBackground = Path();
      mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
      paint.color = Color(0xFF2032B7);
      canvas.drawPath(mainBackground, paint);

      // For circle drawing
      List<Color> shades = [
        Color(0xFF0115AB), 
        Color(0xFF2032F7), 
        Color(0xFF2032D7) 
      ];
      int x = 0;
      // Random rand = Random(69);
      Random rand = Random();

      // Scatter random circles on the homepage
      while(x < 40){
        paint.color = shades[x % 3];
        double wPlace = rand.nextDouble() * (width * 0.9);
        double hPlace = rand.nextDouble() * (height * 0.9);
        double circleDia  = (rand.nextDouble() * 250) + 50;
        Rect rct = Rect.fromLTWH(wPlace, hPlace, circleDia, circleDia);
        canvas.drawOval(rct, paint);
        x++;
      }
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
  
}
