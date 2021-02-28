import 'package:currensee/screens/productScreen.dart';
import 'package:currensee/screens/myHomePage.dart';
import 'package:currensee/widgets/watchlist.dart';
import 'package:flutter/material.dart';
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
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/prodScreen': (context) => ProductScreen('DefaultProduct'),
      },
    );
  }
}