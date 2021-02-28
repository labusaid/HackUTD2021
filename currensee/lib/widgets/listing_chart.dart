import 'package:currensee/models/listing.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ListingChart extends StatelessWidget {
  final List<Listing> data;
  final DateTime date;
  //final common.DateTimeFactory dateTimeFactory;

  ListingChart({@required this.data, @required this.date});

  @override
  Widget build(BuildContext context) {
    List<Listing> _data = [];

    data.forEach((element) {
      if(element.postDate.isAfter(date)){
        _data.add(element);
      }
    });

    print(_data.length);

    List<charts.Series<Listing, DateTime>> series = [
      charts.Series(
        id: 'stuff',
        data: _data,
        domainFn: (Listing listing, _) => listing.postDate,
        measureFn: (Listing listing, _) => listing.price,
      )
    ];

    return Container(child: charts.TimeSeriesChart(series, animate: true), height: 250, width: 300,);
  }
}
