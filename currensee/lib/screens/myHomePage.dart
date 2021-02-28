import 'package:flutter/material.dart';
import 'package:currensee/models/listing.dart';
import 'package:currensee/widgets/watchlistManip.dart';
import 'package:currensee/widgets/watchlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:currensee/widgets/searchBox.dart';

class MyHomePage extends StatelessWidget {
  static const title = 'CurrenSee';
  final List<Listing> data = [
    Listing(
        name: 'listing1',
        title: 'yeeting my gpu',
        price: 500,
        url: Uri.parse('lereddit.com'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-24')),
    Listing(
        name: 'listing2',
        title: 'yeeting my gpu again',
        price: 400,
        url: Uri.parse('lereddit.com'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-25')),
    Listing(
        name: 'listing3',
        title: 'skeeting my gpu',
        price: 450,
        url: Uri.parse('lereddit.com'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-26'))
  ];

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
                builder: (context, aWL, child) => Watchlist(aWL.dict),
              ),
            ),
            SearchBox()
          ],
        ),
      ),
    );
  }
}
