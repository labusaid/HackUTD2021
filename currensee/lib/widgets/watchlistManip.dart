import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:currensee/widgets/watchlist.dart';

class WatchlistManip extends StatefulWidget {
  final Function a;
  final Function b;

  WatchlistManip(this.a, this.b);

  @override
  _WatchlistManipState createState() => _WatchlistManipState(a, b);
}

class _WatchlistManipState extends State<WatchlistManip> {
  Function add;
  Function remove;

  _WatchlistManipState(this.add, this.remove);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var aWL = Provider.of<WatchDict>(context, listen: false);
    var len = aWL.dict.length;
    return ListTile(
      title: Text(
        'Watchlist',
      ),
      subtitle: AutoSizeText(
        '$len Items',
        maxLines: 1,
      ),
    );
  }
}
