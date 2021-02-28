import 'package:flutter/material.dart';
import 'package:currensee/models/listing.dart';
import 'package:currensee/widgets/watchlistManip.dart';
import 'package:currensee/widgets/watchlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:currensee/widgets/searchBox.dart';

class MyHomePage extends StatelessWidget {
  static const title = 'CurrenSee';
  final List<Listing> data;

  MyHomePage(this.data);

  @override
  Widget build(BuildContext context) {
    var aWL = Provider.of<WatchDict>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        /*actions: [
          Image.asset('logo.png', width: 10, height: 10,)
        ],*/
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text(
              '\n Your Reddit and eBay Trading Assitant.\n\n',
              textAlign: TextAlign.left,
              style: GoogleFonts.cabin(
                  textStyle: TextStyle(
                fontSize: 18,
                color: Colors.blueAccent,
                
              )),
            ),
            WatchlistManip(aWL.add, aWL.remove),
            Container(
              height: 380,
              child: Consumer<WatchDict>(
                builder: (context, aWL, child) => Watchlist(aWL.dict, data),
              ),
            ),
            SearchBox(data)
          ],
        ),
      ),
    );
  }
}
