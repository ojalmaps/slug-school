import 'dart:html';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

CollectionReference comments =
    FirebaseFirestore.instance.collection('comments');

class CommentsPage extends StatefulWidget {
  @override
  createState() => new CommentsPageStateOriginal();
}

class CommentsPageStateOriginal extends State<CommentsPage> {
  var com;
  List fireComments = [];
  final commentController = new TextEditingController();

  Widget _buildFirebaseComments() {
    return ListView.builder(itemBuilder: (context, index) {
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
    return new Scaffold(
        appBar: new AppBar(title: Text("Comments")),
        body: Column(
          children: <Widget>[
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: comments
                    .orderBy("timestamp", descending: false)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  return new ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      return new ListTile(
                          title: new Text(document.data()["comment"]));
                    }).toList(),
                  );
                },
              ),
            ),
            TextField(
              controller: commentController,
              decoration: InputDecoration(hintText: 'Add a comment!'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  com = commentController.text;
                  commentController.clear();
                  comments.add({
                    "comment": com,
                    "timestamp": FieldValue.serverTimestamp()
                  });
                });
                //_findFirebaseComments();
                //Text(fireComments.toString());
              },
              child: Text('Submit'),
            ),
          ],
        ));
  }
}
