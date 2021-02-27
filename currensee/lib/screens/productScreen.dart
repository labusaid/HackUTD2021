import 'package:flutter/material.dart';
import '../widgets/prNameHeader.dart';
import '../widgets/graph.dart';
import '../widgets/graphFilter.dart';
import '../widgets/priceList.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PrNameHeader('productName'),
        Graph(),
        GraphFilter(),
        PriceList(),
      ],
    );
  }
}
