import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'theme/themes.dart';
import 'screens/profpages.dart';

void main() {
  runApp(MyApp());
}

// final ThemeData _themeData = new ThemeData(
//   brightness: Brightness.dark,
//   primarySwatch: Colors.blue,
//   accentColor: Colors.yellow
// );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slug Meet',
      theme: getSlugTheme(),
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
    return Scaffold(
       body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //We take the image from the assets
                Image.asset(
                  'images/slug.png',
                  height: 250,
                ),
                SizedBox(
                  height: 20,
                ),
                //Texts and Styling of them
                Text(
                  'Welcome to Slug Meet!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 20),
                Text(
                  'An app to help you make important enrollment decisions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                //Our MaterialButton which when pressed will take us to a new screen named as 
                //LoginScreen
                MaterialButton(
                  elevation: 0,
                  height: 50,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Get Started',
                          style: TextStyle(color: Colors.black, fontSize: 20,),
                          ),
                      Icon(Icons.arrow_forward_ios, color: Colors.black,)
                    ],
                  ),
                  textColor: Colors.white,
                ),
                MaterialButton(
                  child: Row(children: <Widget>[Text("Click for Dummy Prof Page", textAlign: TextAlign.center,), 
                                      Icon(Icons.account_circle_sharp),],
                                      mainAxisAlignment: MainAxisAlignment.center,
                            ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProfPage(
                            'Mystery Slug', 
                            Image.asset('images/anonymous-user.png', height: 250, ),
                            ['CSE101', 'CSE12', 'CSE13S']
                          )
                        ));
                  }
                )
              ],
            ),
    );
  }
}

