import 'package:flutter/material.dart';
import 'package:sandbox/screens/coursepages.dart';
import 'screens/login.dart';
import 'theme/themes.dart';
import 'screens/profpages.dart';
import 'screens/formpage.dart';
import 'screens/searchpage.dart';
import 'screens/comments.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slug School',
      theme: SlugThemes().getSlugTheme(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    SlugThemes homeThemes = SlugThemes();
    return CustomPaint(
        painter: MyPainter(),
        child: ListView(
                
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(
                      'Welcome to Slug School!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 48,
                        ),
                      ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'An app to help you make enrollment decisions at UC Santa Cruz.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  //We take the image from the assets
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Image(
                        image: AssetImage('../images/SlugSchoolColor.png'),
                        height: 250, 
                      ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  
                 
                  //Our MaterialButton which when pressed will take us to a new screen named as
                  //LoginScreen
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 250.0, vertical: 6.0),
                  //     child: MaterialButton(
                  //       elevation: 0,
                  //       height: 50,
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context, MaterialPageRoute(builder: (_) => LoginScreen()));
                  //       },
                  //       child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: <Widget>[
                  //             Text(
                  //               'Log In ',
                  //               style: homeThemes.homePageButtomTheme(),
                  //             ),
                  //             Icon(
                  //               Icons.arrow_forward_ios,
                  //               color: Colors.white,
                  //             )
                  //           ],
                  //         ),
                  //       textColor: Colors.white,
                  //     ),
                  // ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 250.0, vertical: 6.0),
                    child: MaterialButton(
                      // button to redirect to search page
                      elevation: 0,
                      height: 50,
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => SearchPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Search for a Professor ',
                            style: homeThemes.homePageButtomTheme(),
                          ),
                          Icon(
                            Icons.person_search,
                            color: Colors.white,
                          )
                        ],
                      ),
                      textColor: Colors.white,
                    )
                  ),

                  // MaterialButton(
                  //   // button to redirect to comments
                  //   elevation: 0,
                  //   height: 50,
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context, MaterialPageRoute(builder: (_) => CommentsPage()));
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Text(
                  //         'Dummy Comments',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.arrow_forward_ios,
                  //         color: Colors.white,
                  //       )
                  //     ],
                  //   ),
                  //   textColor: Colors.white,
                  // ),

                  // MaterialButton(
                  //   // button to redirect to html form page
                  //   elevation: 0,
                  //   height: 50,
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context, MaterialPageRoute(builder: (_) => FormPage()));
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Text(
                  //         'Test HTML Form Page',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.arrow_forward_ios,
                  //         color: Colors.white,
                  //       )
                  //     ],
                  //   ),
                  //   textColor: Colors.white,
                  // ),
                  // MaterialButton(
                  //     child: Row(
                  //       children: <Widget>[
                  //         Text(
                  //           "Click for Dummy Course Page",
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Icon(Icons.account_circle_sharp),
                  //       ],
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (_) => CoursePage(
                  //                     Course("Fall2011_CourseNumber", "CMPS- 5J"),
                  //                   )));
                  //     }),
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
                        child:Text(
                          "How It Works",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 36,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            decoration: TextDecoration.none
                            ),
                        ), 
                      ),
                      
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 600.0),
                        child: Divider(
                          height: 36.0,
                          thickness: 12.0,
                          color: homeThemes.accentTwo,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 650.0),
                        child:Text(
                          "Navigate to the search page above to find the professor that you are looking for. "
                          "When you see and click on the desired professor, you will be taken to their page."
                          " On the professor page you can find the grade distributions for previous courses they"
                          " have taught, comments previous students have written about the professor, and a feedback "
                          "form that you can fill out if you have also taken their class before.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                            decoration: TextDecoration.none
                            ),
                        ), 
                      ),
                      
                ],
              ),
      );
  }
}

class FailPage extends StatefulWidget {
  FailPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FailPageState createState() => _FailPageState();
}

class _FailPageState extends State<FailPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
        children: [
          Text(
            "The Connection with firestore failed!",
            style: new TextStyle(fontSize: 36),
          ),
        ],
      ),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return FailPage();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return FailPage();
      },
    );
  }
}
