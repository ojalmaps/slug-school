import 'dart:html';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference comments =
    FirebaseFirestore.instance.collection('comments');

class CommentsPage extends StatefulWidget {
  @override
  createState() => new CommentsPageState();
}

class CommentsPageState extends State<CommentsPage> {
  List<String> _comments = [];
  var com;
  final commentController = new TextEditingController();

  void _addComment(String val) {
    setState(() {
      _comments.add(val);
    });
    comments.add({"comments": val});
  }

  Widget _buildCommentList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _comments.length) {
        return _buildCommentItem(_comments[index]);
      } else {
        return Text("No Available Comments");
      }
    });
  }

  void _buildFirebaseComments() {
    comments.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        _buildFirebaseComment(result.data());
      });
    });
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(title: Text(comment));
  }

  Widget _buildFirebaseComment(Map<String, dynamic> comment) {
    return ListTile(title: Text(comment[0]));
  }

  @override
  Widget build(BuildContext contect) {
    _buildFirebaseComments();
    return Scaffold(
        appBar: new AppBar(title: Text("Comments")),
        body: Column(children: <Widget>[
          //Expanded(child: _buildCommentList()),
          TextField(
            controller: commentController,
            decoration: InputDecoration(hintText: 'Add a comment!'),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                com = commentController.text;
                comments.add({"comments": com});
              });
            },
            child: Text('Submit'),
          ),
          Text("Your comment: $com")
        ]));
  }
}
