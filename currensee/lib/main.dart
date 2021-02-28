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

  // final testData = await firestoreService.getAllListings();
  final testData1 = await firestoreService.getListings('rtx 3080');
  final testData2 = await firestoreService.getListings('rtx 3070');
  final testData3 = await firestoreService.getListings('rtx 3060');
  final testData4 = await firestoreService.getListings('geforce gtx 1080');
  final testData5 = await firestoreService.getListings('geforce gtx 1060');
  final testData6 = await firestoreService.getListings('quadro p1000');
  final testData7 = await firestoreService.getListings('rx 6800');
  final testData8 = await firestoreService.getListings('rx 6800 xt');
  final testData9 = await firestoreService.getListings('rx 570');
  final testData = testData1 +
      testData2 +
      testData3 +
      testData4 +
      testData5 +
      testData6 +
      testData7 +
      testData8 +
      testData9;
  print(testData);

  runApp(
    ChangeNotifierProvider(
      create: (context) => WatchDict(),
      child: MyApp(testData),
    ),
  );
}

class MyApp extends StatefulWidget {
  final testData;
  MyApp(this.testData);

  @override
  _MyAppState createState() => _MyAppState(this.testData);
}

class _MyAppState extends State<MyApp> {
  List<Listing> data;

  _MyAppState(testData) {
    data = testData;
  }

  // List<Listing> data = [
  //   Listing(
  //       name: 'ProductUnique',
  //       title: 'yeeting my gpu',
  //       price: 500,
  //       url: Uri.parse('https://www.google.com/'),
  //       postDate: DateTime.parse('2021-02-28 20:18:04Z')),
  //   Listing(
  //       name: 'ProductUnique',
  //       title: 'yeeting my gpu again',
  //       price: 400,
  //       url: Uri.parse('lereddit.com'),
  //       postDate: DateTime.parse('2021-02-28 10:18:04Z')),
  //   Listing(
  //       name: 'ProductUnique',
  //       title: 'skeeting my gpu',
  //       price: 450,
  //       url: Uri.parse('lereddit.com'),
  //       postDate: DateTime.parse('2021-02-28 00:18:04Z')),
  //   Listing(
  //       name: 'Product5',
  //       title: 'yeeting my gpu',
  //       price: 500,
  //       url: Uri.parse('https://www.google.com/'),
  //       postDate: DateTime.parse('2021-02-26 20:18:04Z')),
  //   Listing(
  //       name: 'Product4',
  //       title: 'yeeting my gpu again',
  //       price: 400,
  //       url: Uri.parse('lereddit.com'),
  //       postDate: DateTime.parse('2021-02-02 20:18:04Z')),
  //   Listing(
  //       name: 'Product2',
  //       title: 'yeeting my gpu',
  //       price: 500,
  //       url: Uri.parse('https://www.google.com/'),
  //       postDate: DateTime.parse('2021-02-04 20:18:04Z')),
  //   Listing(
  //       name: 'ProductUnique',
  //       title: 'yeeting my gpu again',
  //       price: 400,
  //       url: Uri.parse('lereddit.com'),
  //       postDate: DateTime.parse('2021-02-12 20:18:04Z')),
  //   Listing(
  //       name: 'Product1',
  //       title: 'skeeting my gpu',
  //       price: 450,
  //       url: Uri.parse('lereddit.com'),
  //       postDate: DateTime.parse('2021-02-14 20:18:04Z'))
  // ];

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
