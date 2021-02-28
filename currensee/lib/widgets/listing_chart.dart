import 'package:currensee/models/listing.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ListingChart extends StatelessWidget {
  final List<Listing> data;

  ListingChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Listing, DateTime>> series = [
      charts.Series(
        id: 'stuff',
        data: data,
        domainFn: (Listing listing, _) => listing.postDate,
        measureFn: (Listing listing, _) => listing.price,
      )
    ];

    return Container(child: charts.TimeSeriesChart(series, animate: true), height: 100, width: 100,);
  }
}
