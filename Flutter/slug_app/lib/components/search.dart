// Trevor:
//   Most of this code was given and modified from the following YouTube
//   video: https://www.youtube.com/watch?v=H3CCtCmBUoQ

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  Future resultsLoaded;
  List allResults = [
    'Abadi, Martin',
    'Abrams, Elizabeth',
    'Abrams, Zsuzsanna',
    'Aissen, Judith',
    'Akeson, Mark',
    'Anand, Pranav',
    'Anderson, Mark',
    'Ares, Manuel',
    'Aronson, Elliot',
    'CSE 13S',
    'CSE 16',
    'CSE 142',
    'CSE 144',
    'CSE 180',
    'CSE 182',
    'CHEM 1A',
    'CHEM 1B',
    'CHEM 1M',
    'CHEM 1C',
    'CHEM 1N',
    'CHEM 8A',
    'CHEM 8B'
  ];
  List resultsList = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    List showResults = [];

    if (searchController.text != "") {
      for (var query in allResults) {
        var title = query.toLowerCase();
        if (title.startsWith(searchController.text.toLowerCase())) {
          showResults.add(query);
        }
      }
    }

    setState(() {
      resultsList = showResults;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 15),
            child: Text("Search for a course and/or professor: ",
                style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 60),
              itemCount: resultsList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Text(
                  resultsList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
