import 'package:currensee/screens/productScreen.dart';
import 'package:currensee/screens/myHomePage.dart';
import 'package:currensee/services/firestore_service.dart';
import 'package:currensee/widgets/watchlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  @override
  void initState() {
    super.initState();
    final FirestoreService firestoreService = FirestoreService();

    final data = firestoreService.getListings();
    print(data);
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
        '/': (context) => MyHomePage(),
        '/prodScreen': (context) => ProductScreen('DefaultProduct'),
      },
    );
  }
}
