import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Listing {
  final String name;
  final String title;
  final double price;
  final Uri url;
  final bool iscomplete;
  final DateTime postDate;

  Listing({
    @required this.name,
    @required this.title,
    @required this.price,
    @required this.url,
    @required this.iscomplete,
    @required this.postDate,
  });
}
