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
  var com;
  List fireComments = [];
  final commentController = new TextEditingController();

  Widget _buildFirebaseComments() {
    print("first build");
    print("inside of build: $fireComments");
    return ListView.builder(itemBuilder: (context, index) {
      //if (index < fireComments.length) {
      //  print("building item");
      //  return _buildCommentItem(fireComments[index]);
      //} else {
      //  return Text("No Available Comments");
      //}
      while (index < fireComments.length) {
        return _buildCommentItem(fireComments[index]);
      }
    });
  }

  List _findFirebaseComments() {
    comments.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        fireComments.add(doc["comment"]);
        print(fireComments);
      });
    });
    return fireComments;
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(title: Text(comment));
  }

  @override
  Widget build(BuildContext context) {
    _findFirebaseComments();
    return Scaffold(
        appBar: new AppBar(title: Text("Comments")),
        body: Column(children: <Widget>[
          Expanded(child: _buildFirebaseComments()),
          //Text(fireComments.toString()),
          TextField(
            controller: commentController,
            decoration: InputDecoration(hintText: 'Add a comment!'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                com = commentController.text;
                comments.add({"comment": com});
              });
              //_findFirebaseComments();
              //Text(fireComments.toString());
            },
            child: Text('Submit'),
          ),
          Text("Your comment: $com"),
          //_buildFirebaseComments()
        ]));
  }
}
