import 'package:flutter/material.dart';
import 'package:currensee/models/listing.dart';
import 'package:intl/intl.dart';

class PriceListing extends StatelessWidget {
  final Listing aListing;

  PriceListing(this.aListing);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM-dd-yyyy HH:mm");
    String string = dateFormat.format(aListing.postDate);
    return Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text(aListing.name),
        subtitle: Text(string),
        trailing: Text('\$' + aListing.price.toString()),
        onTap: () => {},
      )
    );
  }
}