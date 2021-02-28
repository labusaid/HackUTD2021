import 'package:flutter/material.dart';
import 'package:currensee/screens/productScreen.dart';
import 'package:currensee/models/listing.dart';

class SearchBox extends StatefulWidget {
  final List<Listing> data;
  SearchBox(this.data);
  @override
  _SearchBoxState createState() => _SearchBoxState(data);
}

class _SearchBoxState extends State<SearchBox> {
  List<Listing> data;

  _SearchBoxState(this.data);


  @override
  Widget build(BuildContext context) {
    List<String> list = [];
    data.forEach((element) {
      list.add(element.name);
    });
    Set<String> nameSet = list.toSet();
    list = nameSet.toList();
    print(list);
    return Container(
        child: IconButton(
      onPressed: () =>
          {showSearch(context: context, delegate: Search(list, data))},
      tooltip: 'Navigate to Product Catalog',
      icon: Icon(Icons.search),
    ));
  }
}

class Search extends SearchDelegate {
  @override
  TextStyle get searchFieldStyle => TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context).copyWith(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
    assert(theme != null);
    return theme;
  }

  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          selectedResult,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  final List<String> listExample;
  final List<Listing> data;
  Search(this.listExample, this.data);

  List<String> recentList = ["rtx 3080", "rtx 3070"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductScreen(suggestionList[index], data)));
          },
        );
      },
    );
  }
}
