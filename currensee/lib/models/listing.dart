import 'package:flutter/foundation.dart';

class Listing {
  final String name;
  final String title;
  final double price;
  final Uri url;
  final DateTime postDate;

  Listing({
    @required this.name,
    @required this.title,
    @required this.price,
    @required this.url,
    @required this.postDate,
  });

  @override
  String toString() {
    return (this.name +
        this.title +
        this.price.toString() +
        this.url.toString() +
        this.postDate.toString());
  }
}
