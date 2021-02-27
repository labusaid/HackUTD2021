import 'package:flutter/material.dart';

class PrNameHeader extends StatelessWidget {
  final String productName;
  final int fontSize;

  PrNameHeader(this.productName, this.fontSize);

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
