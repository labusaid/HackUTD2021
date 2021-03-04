import 'package:flutter/material.dart';
import 'package:currensee/widgets/graphing/graphFilter.dart';
import 'package:currensee/widgets/graphing/listing_chart.dart';
import 'package:currensee/models/listing.dart';

class DynamicGraph extends StatefulWidget {
  final List<Listing> _data;

  DynamicGraph(this._data);

  @override
  _DynamicGraphState createState() => _DynamicGraphState(_data);
}

class _DynamicGraphState extends State<DynamicGraph> {
  final List<Listing> _data;
  final now = new DateTime.now();
  int daysAgo = 1;

  DateTime get dateFilter {
    return now.subtract(Duration(days: daysAgo));
  }

  _DynamicGraphState(this._data);

  void day() {
    setState(() {
      daysAgo = 1;
    });
  }

  void week() {
    setState(() {
      daysAgo = 7;
    });
  }

  void month() {
    setState(() {
      daysAgo = 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListingChart(data: _data, date: this.dateFilter),
        GraphFilter(day, week, month),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
