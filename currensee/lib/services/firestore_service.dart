// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:currensee/models/listing.dart';

class FirestoreService {
  FirebaseFirestore firestore;

  FirestoreService() {
    this.firestore = FirebaseFirestore.instance;
  }

  Future<List<Listing>> getListings(String itemId) async {
    List<Listing> _listings = List<Listing>();
    await firestore.collection('reddit').doc(itemId).get().then(
        (DocumentSnapshot documentSnapshot) =>
            {_listings = docToListings(documentSnapshot)});

    return _listings;
  }

  Future<List<Listing>> getAllListings() async {
    QuerySnapshot snapshot = await firestore.collection('reddit').get();
    List<Listing> _listings = List<Listing>();
    snapshot.docs.forEach((doc) async {
      final _docListings = await getListings(doc['name']);
      _listings.addAll(_docListings);
    });

    return _listings;
  }

  List<Listing> docToListings(DocumentSnapshot snapshot) {
    List<Listing> _listings = List<Listing>();
    snapshot['posts'].forEach((post) => {
          _listings.add(new Listing(
              name: snapshot['name'],
              title: post['title'],
              price: post['price'].toDouble(),
              url: Uri.parse(post['url']),
              postDate: DateTime.parse(post['postDate'].toString())))
        });

    return _listings;
  }
}
