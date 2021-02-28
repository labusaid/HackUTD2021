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

  final testData = await firestoreService.getListings('rtx 3080');
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
  _MyAppState createState() => _MyAppState(testData);
}

class _MyAppState extends State<MyApp> {
  List<Listing> data;

  _MyAppState(this.data);

  /*List<Listing> data = [
      Listing(
          name: 'AMD Ryzen 7',
          title: 'selling my gpu :(',
          price: 500,
          url: Uri.parse('https://www.reddit.com/r/hardwareswap/comments/lukk1j/usade_h_amd_ryzen_7_5800x_w_paypal_local_cash/'),
          postDate: DateTime.parse('2021-02-28 20:18:04Z')),
      Listing(
          name: 'Nvidia Quadro',
          title: 'bidding war on my gpu again',
          price: 400,
          url: Uri.parse('https://www.reddit.com/r/homelabsales/comments/9fmvkt/fs_usamd_h_quadro_p5000_16gb_ddr3_w_paypal_xpost/'),
          postDate: DateTime.parse('2021-02-28 10:18:04Z')),
      Listing(
          name: 'Nvidia GTX',
          title: 'buying a gpu for a kidney',
          price: 450,
          url: Uri.parse('https://www.reddit.com/r/hardwareswap/comments/lukn88/usanv_h_evga_gtx_1080_sc2_w_paypal_local_cash/'),
          postDate: DateTime.parse('2021-02-28 00:18:04Z')),
      Listing(
          name: 'Nvidia RTX',
          title: 'need cash for my gpu',
          price: 500,
          url: Uri.parse('https://www.reddit.com/r/hardwareswap/comments/luj5xe/usaaz_h_paypal_w_rtx_2060_or_similar_card/'),
          postDate: DateTime.parse('2021-02-26 20:18:04Z')),
      Listing(
          name: 'Intel 250',
          title: 're-yeeting my gpu again',
          price: 400,
          url: Uri.parse('https://www.reddit.com/r/appleswap/comments/5bzfvc/usacah_2014_macbook_air_116_w_intel_core_i7_8gb/'),
          postDate: DateTime.parse('2021-02-02 20:18:04Z')),
      Listing(
          name: 'Google TPU',
          title: 'yeeting my gpu',
          price: 500,
          url: Uri.parse('https://www.google.com/'),
          postDate: DateTime.parse('2021-02-04 20:18:04Z')),
      Listing(
          name: 'Nvidia RTX Pro',
          title: 'yeeting my gpu again',
          price: 400,
          url: Uri.parse('https://www.reddit.com/r/eGPU/comments/j6e07v/for_sale_rtx_3080_ftw3_ultra_mantiz_saturn_pro_ii/'),
          postDate: DateTime.parse('2021-02-12 20:18:04Z')),
      Listing(
          name: 'AMD Radeon',
          title: 'short selling my gpu',
          price: 450,
          url: Uri.parse('https://www.reddit.com/r/appleswap/comments/ht50xt/usafl_h_mid_2017_macbook_pro_15_i7_7820hq_radeon/'),
          postDate: DateTime.parse('2021-02-14 20:18:04Z'))
    ];*/


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
