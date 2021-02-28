import 'package:currensee/models/listing.dart';
import 'package:currensee/screens/productScreen.dart';
import 'package:currensee/widgets/watchlist.dart';
import 'package:flutter/material.dart';
import './widgets/watchlist.dart';
import './widgets/watchlistManip.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WatchDict(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CurrenSee',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the HomePage widget.
        '/': (context) => MyHomePage(),
        // When navigating to the "/second" route, build the Product widget.
        '/prodScreen': (context) => ProductScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const title = 'CurrenSee';
  final List<Listing> data = [
    Listing(
        name: 'listing1',
        title: 'yeeting my gpu',
        price: 500,
        url: Uri.parse('lereddit.com'),
        iscomplete: false,
        postDate: DateTime.parse('2021-02-24')),
    Listing(
        name: 'listing2',
        title: 'yeeting my gpu again',
        price: 400,
        url: Uri.parse('lereddit.com'),
        iscomplete: false,
        postDate: DateTime.parse('2021-02-25')),
    Listing(
        name: 'listing3',
        title: 'skeeting my gpu',
        price: 450,
        url: Uri.parse('lereddit.com'),
        iscomplete: false,
        postDate: DateTime.parse('2021-02-26'))
  ];

  @override
  Widget build(BuildContext context) {
    var aWL = Provider.of<WatchDict>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text(
              'This is the app\'s Home Page\n\n',
              textAlign: TextAlign.center,
              style: TextStyle(backgroundColor: Colors.teal, fontSize: 20),
            ),
            WatchlistManip(aWL.add, aWL.remove),
            Container(
              height: 380,
              child: Consumer<WatchDict>(
                builder: (context, aWL, child) => Watchlist(aWL.dict),
              ),
            ),
            FloatingActionButton(
              onPressed: () => {Navigator.pushNamed(context, '/prodScreen')},
              tooltip: 'Navigate to Generic Product Page',
              child: Icon(Icons.navigate_next_sharp),
            )
          ],
        ),
      ),
    );
  }
}
