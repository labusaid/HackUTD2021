import 'package:currensee/widgets/pricetListing.dart';
import 'package:flutter/material.dart';

class PriceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ for (var i = 0; i < 10; i++) PriceListing(i)],
    );
  }
}