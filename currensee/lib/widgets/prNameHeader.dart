import 'package:flutter/material.dart';

class PrNameHeader extends StatelessWidget {
  final String productName;

  PrNameHeader(this.productName);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        productName,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
