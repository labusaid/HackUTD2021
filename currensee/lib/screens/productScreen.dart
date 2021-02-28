import 'package:flutter/material.dart';
import 'package:currensee/widgets/prNameHeader.dart';
import 'package:currensee/widgets/graph.dart';
import 'package:currensee/widgets/graphFilter.dart';
import 'package:currensee/widgets/priceList.dart';
import 'package:provider/provider.dart';
import 'package:currensee/widgets/watchlist.dart';

class ProductScreen extends StatelessWidget {
  final String productName;

  ProductScreen(this.productName);

  @override
  Widget build(BuildContext context) {
    var aWL = Provider.of<WatchDict>(context, listen: false);
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
          Graph(200),
          GraphFilter(),
          PriceList(),
        ],
      ),
    );
  }
}
