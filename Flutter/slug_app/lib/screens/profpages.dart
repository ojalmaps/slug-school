import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../theme/themes.dart';

class ProfPage extends StatefulWidget{
    // Professor Name
    final String profname;
    // Professor Picture
    final Image profpic;
    // A list of courses taught by the professor
    final List<String> courses;

    ProfPage(this.profname, this.profpic, this.courses);

    // 
    @override
    _ProfPageState createState() => _ProfPageState(profname, profpic, courses);

}

class _ProfPageState extends State<ProfPage> {
  String profname;
  Image profpic;
  List<String> courses;

  
  // Constructor
  _ProfPageState(this.profname, this.profpic, this.courses);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(this.profname),),
      body: Center(
          child: (Container(
            child: Column(
              children: [this.profpic, 
                Text('This is a professor page!', 
                textAlign: TextAlign.center), 
                Text(' COURSES', textAlign: TextAlign.left,),
                Row(
                  children: this.courses.map(
                      (element) => Card(
                        child: Text(element),
                      )
                    ).toList()
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.yellow)
            ),
          )
          )
      ),
    );
  }
}

class Professor{
  String name;
  Image pic;
  List<String> courses;
  List<String> reviews;
    

  Professor(String profName, Image profPic, List<String> profCourses, List<String> profReviews){
    this.name = profName;
    this.pic = profPic;
    this.courses = profCourses;
    this.reviews = profReviews;
  }

  // (Placeholder) Return an average of the prof's ratings
  int getAverageRating(){
    return 1;
  }
}