import 'dart:math';
import 'package:flutter/material.dart';
import 'package:currensee/widgets/priceWatch.dart';
import 'package:currensee/models/listing.dart';

class WatchDict extends ChangeNotifier {
  // Default watchlist
  final Map<String, double> _watched = {'rtx 3080': 100};

  // TODO: impliment event price preview
  double getPrice(String prodName) {
    var rng = new Random();
    return rng.nextInt(1000).toDouble();
  }

  Map<String, double> get dict {
    return _watched;
  }

  void add(String prodName) {
    _watched.putIfAbsent(prodName, () => getPrice(prodName));
    notifyListeners();
  }

  void remove(String prodName) {
    _watched.remove(prodName);
    notifyListeners();
  }
}

class Watchlist extends StatelessWidget {
  final Map<String, double> watched;
  final List<Listing> data;

  Watchlist(this.watched, this.data);

  @override
  Widget build(BuildContext context) {
    List<Widget> chList = [];
    watched.forEach((key, value) {
      List<Listing> _data = [];
      data.forEach((element) {
        if (element.name == key) {
          _data.add(element);
        }
      });
      chList.add(PriceWatch(key, value, _data));
    });
    return ListView(
      children: chList,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }
}
