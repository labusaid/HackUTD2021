import 'package:flutter/material.dart';
import 'package:currensee/models/listing.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    DateFormat dateFormat = DateFormat("MM/dd/yyyy hh:mm");
    String string = dateFormat.format(aListing.postDate);
    return Card(
        child: ListTile(
      leading: FlutterLogo(),
      title: AutoSizeText(aListing.title),
      subtitle: AutoSizeText(string),
      trailing: AutoSizeText('\$' + aListing.price.toString()),
      onTap: () {
        _launchURL(aListing.url.toString());
      },
    ));
  }
}
