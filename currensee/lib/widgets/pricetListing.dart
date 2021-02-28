import 'package:flutter/material.dart';
import 'package:currensee/models/listing.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class PriceListing extends StatelessWidget {
  final Listing aListing;

  PriceListing(this.aListing);

   _launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

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
        onTap: () {_launchURL(aListing.url.toString());},
      )
    );
  }
}