import 'package:flutter/material.dart';

class PriceListing extends StatelessWidget {
  final int listingNo;

  PriceListing(this.listingNo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line with leading widget, Listing: ' + listingNo.toString()),
        onTap: () => {},
      )
    );
  }
}