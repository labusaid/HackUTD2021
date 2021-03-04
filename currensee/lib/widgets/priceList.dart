import 'package:currensee/widgets/pricetListing.dart';
import 'package:flutter/material.dart';
import 'package:currensee/models/listing.dart';

class PriceList extends StatelessWidget {
  final List<Listing> listOfItems;

  PriceList(this.listOfItems);

  // TODO: replace with listbuilder
  @override
  Widget build(BuildContext context) {
    List<Widget> chList = [];
    listOfItems.forEach((element) {
      chList.add(PriceListing(element));
    });
    return Column(
      children: chList,
    );
  }
}
