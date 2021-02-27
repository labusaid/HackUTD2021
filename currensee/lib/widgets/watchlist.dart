import 'package:flutter/material.dart';
import './priceWatch.dart';

class Watchlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [for (var i = 0; i < 20; i++) PriceWatch('Product'+i.toString(), 100)],
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}