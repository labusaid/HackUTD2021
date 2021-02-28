// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:currensee/models/listing.dart';

class FirestoreService {
  FirebaseFirestore firestore;
  List<Listing> _listings = List<Listing>();

  FirestoreService() {
    this.firestore = FirebaseFirestore.instance;
  }

  Future<List<Listing>> getListings() async {
    firestore.collection('reddit').doc('Selling').get().then(
        (DocumentSnapshot documentSnapshot) =>
            {_listings.add(docToListing(documentSnapshot))});

    print(_listings);
    return _listings;
  }

  Listing docToListing(DocumentSnapshot snapshot) {
    final post = snapshot['posts'][0];
    return new Listing(
        name: snapshot['name'],
        title: post['title'],
        price: post['price'].toDouble(),
        url: Uri.parse(post['url']),
        isComplete: post['isComplete'],
        postDate: DateTime.fromMicrosecondsSinceEpoch(
            post['postDate'].microsecondsSinceEpoch));
  }
}
