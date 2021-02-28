import 'package:currensee/widgets/graph.dart';
import 'package:flutter/material.dart';
import '../screens/showDeleteConfirm.dart';

class PriceWatch extends StatelessWidget {
  final String productName;
  final double price;
  String get priceString {
    return "\$" + price.toString();
  }

  PriceWatch(this.productName, this.price);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, '/prodScreen')},
      onLongPress: (){
        showAlertDialog(context, productName);
      },
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