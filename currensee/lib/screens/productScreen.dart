import 'package:flutter/material.dart';
import '../widgets/prNameHeader.dart';
import '../widgets/graph.dart';
import '../widgets/graphFilter.dart';
import '../widgets/priceList.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CurrenSee'),
        /*actions: [
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Return Home',
            onPressed: () => {Navigator.pop(context)},
          ),
        ],*/
      ),
      body: ListView(
        children: [
          PrNameHeader('productName', 28),
          Graph(200),
          GraphFilter(),
          PriceList(),
        ],
      ),
    );
  }
}
