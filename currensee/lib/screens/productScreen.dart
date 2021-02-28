import 'package:currensee/widgets/listing_chart.dart';
import 'package:flutter/material.dart';
import 'package:currensee/widgets/prNameHeader.dart';
import 'package:currensee/widgets/graph.dart';
import 'package:currensee/widgets/graphFilter.dart';
import 'package:currensee/widgets/priceList.dart';
import 'package:currensee/models/listing.dart';
//import 'package:provider/provider.dart';
//import 'package:currensee/widgets/watchlist.dart';

class ProductScreen extends StatelessWidget {
  final String productName;

  ProductScreen(this.productName);

  @override
  Widget build(BuildContext context) {
    //var aWL = Provider.of<WatchDict>(context, listen: false);
    final List<Listing> _data = [
    Listing(
        name: 'Listing1',
        title: 'yeeting my gpu',
        price: 500,
        url: Uri.parse('lereddit.com'),
        iscomplete: false,
        postDate: DateTime.parse('2021-02-24')),
    Listing(
        name: 'Listing2',
        title: 'yeeting my gpu again',
        price: 400,
        url: Uri.parse('lereddit.com'),
        iscomplete: false,
        postDate: DateTime.parse('2021-02-25')),
    Listing(
        name: 'Listing3',
        title: 'skeeting my gpu',
        price: 450,
        url: Uri.parse('lereddit.com'),
        iscomplete: false,
        postDate: DateTime.parse('2021-02-26'))
  ];
    return Scaffold(
      appBar: AppBar(
        title: Text('CurrenSee'),
        /*actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add To Watchlist',
            onPressed: () => {aWL.add(productName)},
          ),
        ],*/
      ),
      body: ListView(
        children: [
          PrNameHeader('$productName', 28),
          ListingChart(data: _data),
          GraphFilter(),
          PriceList(_data),
        ],
      ),
    );
  }
}
