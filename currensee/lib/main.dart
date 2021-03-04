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
  final testData = await firestoreService.getListings('rtx 3080');
  // TODO: create listing stream provider

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
  _MyAppState createState() => _MyAppState(testData);
}

class _MyAppState extends State<MyApp> {
  List<Listing> data;

  _MyAppState(this.data);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CurrenSee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.teal,
        // textTheme: TextTheme(),
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(data),
      },
    );
  }
}
