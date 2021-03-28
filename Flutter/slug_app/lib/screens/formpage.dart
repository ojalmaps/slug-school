// Trevor: this page for the HTML form contains different implementations I tried;
// there are 3 different snippets of code:
//    the 1st one doesn't work and uses flutter_webview
//    the 2nd one somewhat works and uses flutter_html
//    the 3rd one idk wth is going on
// When commenting one implementation out to work on another, you may need to switch
// the dependencies included in the pubspec.yaml file (since flutter_html and flutter_webview)
// seem to be mutually exclusive

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
// import '../components/form.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'dart:js';
// import 'dart:html' as html;
// import 'dart:ui' as ui;

class FormPage extends StatelessWidget {
  static const String _title = 'Anonymous Form';

  // this snippet of code uses components/form.dart; however it doesn't compile
  // fully and throws error "Unsupported operation: Trying to use the default
  // webview implementation for TargetPlatform.windows but there isn't a default one"
  //      - I believe it's just unsupported for Web dev currently??
  //
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: _title,
  //     home: AnonForm(),
  //     theme: ThemeData(
  //       backgroundColor: Colors.blueGrey[50],
  //     ),
  //   );
  // }

  // this snippet of code uses flutter_html and it works for the most part, but it doesn't
  // seem to connect with JS and CSS
  @override
  Widget build(BuildContext context) {
    Widget html = Html(
      data: """<!DOCTYPE html>
        <script src="https://www.gstatic.com/firebasejs/8.2.2/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.24.0/firebase-database.js"></script>

        <html lang="en">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>Anonymous Rating Form</title>
          <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css" />
          
        </head>
        <body>
          <div class="container">
            <h1 class="brand"><span>Rate</span> Your Experience</h1>
            <div class="wrapper">
              <div class="rating-description">
                <br>
                <ul>
                  <li><i class="fa fa-desc"></i>Please assign values as applicable:</li>  <br>
                  <li><i class="fa fa-5"></i> 5 - Excellent</li>
                  <li><i class="fa fa-4"></i> 4 - Good</li>
                  <li><i class="fa fa-3"></i> 3 - Average</li>
                  <li><i class="fa fa-2"></i> 2 - Below Average</li>
                  <li><i class="fa fa-1"></i> 1 - Poor</li>
                </ul>
              </div>
              <div class="questions">
                <div class="alert">Your message has been sent</div>
                <form id = "quickForm">
                  <p>
                    <label>How difficult is this course overall? (5 is hardest)</label>
                    <input type="number" step="1" pattern="\d+" min="1" max="5"  name="overall1" id = "overall1" required>
                  </p>
                  <p>
                    <label>How much did you enjoy this course?</label>
                    <input type="number" step="1" pattern="\d+" min="1" max="5" name="enjoyment1" id = "enjoyment1" required>
                  </p>
                  <p>
                    <label>How heavy is the workload?</label>
                    <input type="number" step="1" pattern="\d+" min="1" max="5" name="workload1" id = "workload1" required>
                  </p>
                  <p>
                    <label>How knowledgeable/prepared is the professor?</label>
                    <input type="number" step="1" pattern="\d+" min="1" max="5" name="prepared1" id = "prepared1" required>
                  </p>
                  <p>
                    <label>How helpful is the professor?</label>
                    <input type="number" step="1" pattern="\d+" min="1" max="5"  name="helpful1" id = "helpful1" required>
                  </p>
                  <p class = "full">
                    <label>Describe your experience:</label>
                    <textarea name = "experience1" rows = "1" maxlength=1000 id = "experience1" ></textarea>
                  </p>
                    <button type = "submit" value="Submit">Submit</button>
                  </p>
                </form>
              </div>
            </div>
          </div>

          <script src = "../components/QuickForm/main.js"></script>

        </body>
        </html>
        """, 
      style: {
        "body": Style(
          backgroundColor:  Colors.blue.shade100,
          color: Colors.white,
          fontFamily: 'Segoe UI',
          padding: EdgeInsets.all(1),
        ),

        "container": Style(
          width: 1170,
          padding: EdgeInsets.all(1),
        ),

        "ul": Style(
          padding: EdgeInsets.all(0),
        ),

        "brand": Style(
          textAlign: TextAlign.center,
        ),

        "brand span": Style(
          color: Colors.white,
        ),

        // "wrapper": Style(
        //   textShadow: Shadow(offset: 0, ),

        // )

        "wrapper > *": Style(
          padding: EdgeInsets.all(1),
        ),

        "rating-description": Style(
          backgroundColor: Colors.lightBlue.shade100,
        ),

        "rating-description h3, rating-description ul": Style(
          textAlign: TextAlign.left,
          padding: const EdgeInsets.only(
            left: 0,
            top: 0,
            right: 0,
            bottom: 1,
          ),
        ),

        "questions": Style(
          backgroundColor: Colors.lightBlue.shade50,
        ),

        "contact form": Style(
          display: Display.INLINE,
        ),

        "contact form label": Style(
          display: Display.BLOCK,
        ),

        "contact form button, contact form input, contact form textarea": Style(
          padding: EdgeInsets.all(1),
          border: Border.all(
            color: Colors.lightBlue.shade100,
            width: 1,
            style: BorderStyle.solid,
          )
        ),


    });

    return MaterialApp(
      title: _title,
      home: Container(
        child: html,
        color: Colors.blueGrey,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 300,
        width: 300,
      ),
    );
  }

// this one is j complicated af -- https://medium.com/@rody.davis.jr/displaying-html-in-flutter-8da44773764
  // static html.IFrameElement _iFrameElement = html.IFrameElement();

  // void _setup(String src, num width, num height) {
  //   final src = widget.src;
  //   ui.platformViewRegistry.registerViewFactory('iframe-$src', (int viewId) )

  // }

}
