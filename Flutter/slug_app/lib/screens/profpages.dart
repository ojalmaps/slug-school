import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../theme/themes.dart';
import 'coursepages.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';


class ProfPage extends StatefulWidget{
    // Professor
    final Professor prof;

    ProfPage(this.prof);

    // 
    @override
    _ProfPageState createState() => _ProfPageState(this.prof);

}

class _ProfPageState extends State<ProfPage> {
  Professor prof;

  
  // Constructor
  _ProfPageState(this.prof);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(prof.name),),
      body: Center(
          child: (Container(
            child: Column(
              children: [
                ClipOval(child: Image.asset('images/anonymous-user.png', height: 250, )), 
                Text('This is a professor page!', 
                textAlign: TextAlign.center), 
                Text(' COURSE', textAlign: TextAlign.left,),
                Column(
                  children: prof.info.map((element) => new Text(element)).toList()
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
  List<String> info;
  List<int> grades;


  Professor(List<String> infrm, List<int> grds){
    this.name = infrm[0];
    this.info = infrm;
    this.grades = grds;
  }

  // (Placeholder) Return an average of the prof's ratings
  int getAverageRating(){
    return 1;
  }
}