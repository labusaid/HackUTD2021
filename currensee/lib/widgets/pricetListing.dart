import 'package:flutter/material.dart';
import 'package:currensee/models/listing.dart';

class PriceListing extends StatelessWidget {
  final Listing aListing;

  PriceListing(this.aListing);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text(aListing.name),
        subtitle: Text(aListing.postDate.toString()),
        trailing: Text('\$' + aListing.price.toString()),
        onTap: () => {},
      )
    );
  }
}