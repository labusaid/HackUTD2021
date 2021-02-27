import 'package:currensee/widgets/graph.dart';
import 'package:currensee/widgets/prNameHeader.dart';
import 'package:flutter/material.dart';

class PriceWatch extends StatelessWidget {
  final String productName;
  final int price;
  String get priceString {
    return "\$" + price.toString();
  }

  PriceWatch(this.productName, this.price);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, '/prodScreen')},
      child: Card(
        child: Row(
          children: [
            Text(productName),
            Graph(40),
            FittedBox(fit: BoxFit.contain, child: Text(priceString))
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        color: Colors.blue,
      ),
    );
  }
}
