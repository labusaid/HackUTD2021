import 'package:flutter/material.dart';
import 'package:currensee/widgets/graphFilter.dart';
import 'package:currensee/widgets/listing_chart.dart';
import 'package:currensee/models/listing.dart';

class DynamicGraph extends StatefulWidget {
  final List<Listing> _data;

  DynamicGraph(this._data);

  @override
  _DynamicGraphState createState() => _DynamicGraphState(_data);
}

class _DynamicGraphState extends State<DynamicGraph> {
  final List<Listing> _data;

  _DynamicGraphState(this._data);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListingChart(data: _data),
      GraphFilter(),
    ],
    mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
