import 'package:flutter/material.dart';
import 'package:currensee/widgets/prNameHeader.dart';
import 'package:currensee/widgets/priceList.dart';
import 'package:currensee/widgets/dynaGraph.dart';
import 'package:currensee/models/listing.dart';
import 'package:provider/provider.dart';
import 'package:currensee/widgets/watchlist.dart';

class ProductScreen extends StatelessWidget {
  final String productName;
  final List<Listing> _data;

  ProductScreen(this.productName, this._data);

  @override
  Widget build(BuildContext context) {
    var aWL = Provider.of<WatchDict>(context, listen: false);
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
