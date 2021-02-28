// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:currensee/models/listing.dart';

class FirestoreService {
  FirebaseFirestore firestore;
  List<Listing> _listings = List<Listing>();

  FirestoreService() {
    this.firestore = FirebaseFirestore.instance;
  }

  Future<List<Listing>> getListings(String itemId) async {
    await firestore.collection('reddit').doc(itemId).get().then(
        (DocumentSnapshot documentSnapshot) =>
            {_listings = docToListings(documentSnapshot)});

    return _listings;
  }

  List<Listing> docToListings(DocumentSnapshot snapshot) {
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
