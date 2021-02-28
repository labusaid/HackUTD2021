import 'package:flutter/material.dart';
import 'package:currensee/widgets/prNameHeader.dart';
import 'package:currensee/widgets/priceList.dart';
import 'package:currensee/widgets/dynaGraph.dart';
import 'package:currensee/models/listing.dart';
import 'package:provider/provider.dart';
import 'package:currensee/widgets/watchlist.dart';

class ProductScreen extends StatelessWidget {
  final String productName;

  ProductScreen(this.productName);

  @override
  Widget build(BuildContext context) {
    var aWL = Provider.of<WatchDict>(context, listen: false);
    final List<Listing> _data = [
      Listing(
          name: 'Listing1',
          title: 'yeeting my gpu',
          price: 500,
          url: Uri.parse('https://www.google.com/'),
          isComplete: false,
          postDate: DateTime.parse('2021-02-28 20:18:04Z')),
      Listing(
          name: 'Listing2',
          title: 'yeeting my gpu again',
          price: 400,
          url: Uri.parse('lereddit.com'),
          isComplete: false,
          postDate: DateTime.parse('2021-02-28 10:18:04Z')),
      Listing(
          name: 'Listing3',
          title: 'skeeting my gpu',
          price: 450,
          url: Uri.parse('lereddit.com'),
          isComplete: false,
          postDate: DateTime.parse('2021-02-28 00:18:04Z')),
      Listing(
          name: 'Listing1',
          title: 'yeeting my gpu',
          price: 500,
          url: Uri.parse('https://www.google.com/'),
          isComplete: false,
          postDate: DateTime.parse('2021-02-26 20:18:04Z')),
      Listing(
          name: 'Listing2',
          title: 'yeeting my gpu again',
          price: 400,
          url: Uri.parse('lereddit.com'),
          isComplete: false,
          postDate: DateTime.parse('2021-02-02 20:18:04Z')),
      Listing(
          name: 'Listing1',
          title: 'yeeting my gpu',
          price: 500,
          url: Uri.parse('https://www.google.com/'),
          isComplete: false,
          postDate: DateTime.parse('2021-02-04 20:18:04Z')),
      Listing(
          name: 'Listing2',
          title: 'yeeting my gpu again',
          price: 400,
          url: Uri.parse('lereddit.com'),
          isComplete: false,
          postDate: DateTime.parse('2021-02-12 20:18:04Z')),
      Listing(
          name: 'Listing3',
          title: 'skeeting my gpu',
          price: 450,
          url: Uri.parse('lereddit.com'),
          isComplete: false,
          postDate: DateTime.parse('2021-02-14 20:18:04Z'))
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('CurrenSee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add To Watchlist',
            onPressed: () => {aWL.add(productName)},
          ),
        ],
      ),
      body: ListView(
        children: [
          PrNameHeader('$productName', 28),
          DynamicGraph(_data),
          PriceList(_data),
        ],
      ),
    );
  }
}
