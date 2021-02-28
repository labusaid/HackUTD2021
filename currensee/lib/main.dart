import 'package:currensee/screens/myHomePage.dart';
import 'package:currensee/services/firestore_service.dart';
import 'package:currensee/widgets/watchlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currensee/models/listing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final FirestoreService firestoreService = FirestoreService();

  //final data = await firestoreService.getListings();
  //print(data);

  runApp(
    ChangeNotifierProvider(
      create: (context) => WatchDict(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Listing> data = [
    Listing(
        name: 'ProductUnique',
        title: 'yeeting my gpu',
        price: 500,
        url: Uri.parse('https://www.google.com/'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-28 20:18:04Z')),
    Listing(
        name: 'ProductUnique',
        title: 'yeeting my gpu again',
        price: 400,
        url: Uri.parse('lereddit.com'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-28 10:18:04Z')),
    Listing(
        name: 'ProductUnique',
        title: 'skeeting my gpu',
        price: 450,
        url: Uri.parse('lereddit.com'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-28 00:18:04Z')),
    Listing(
        name: 'Product5',
        title: 'yeeting my gpu',
        price: 500,
        url: Uri.parse('https://www.google.com/'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-26 20:18:04Z')),
    Listing(
        name: 'Product4',
        title: 'yeeting my gpu again',
        price: 400,
        url: Uri.parse('lereddit.com'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-02 20:18:04Z')),
    Listing(
        name: 'Product2',
        title: 'yeeting my gpu',
        price: 500,
        url: Uri.parse('https://www.google.com/'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-04 20:18:04Z')),
    Listing(
        name: 'ProductUnique',
        title: 'yeeting my gpu again',
        price: 400,
        url: Uri.parse('lereddit.com'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-12 20:18:04Z')),
    Listing(
        name: 'Product1',
        title: 'skeeting my gpu',
        price: 450,
        url: Uri.parse('lereddit.com'),
        isComplete: false,
        postDate: DateTime.parse('2021-02-14 20:18:04Z'))
  ];

  @override
  void initState() {
    super.initState();
  }

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
        '/': (context) => MyHomePage(data),
      },
    );
  }
}
