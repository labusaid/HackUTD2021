// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:currensee/models/listing.dart';

class FirestoreService {
  FirebaseFirestore firestore;

  FirestoreService() {
    this.firestore = FirebaseFirestore.instance;
  }

  List<Listing> getListings() {
    var listings;
    firestore
        .collection('reddit')
        .doc('RTX3080')
        .get()
        .then((DocumentSnapshot documentSnapshot) => {
              if (documentSnapshot.exists)
                {print('document exitst')}
              else
                print('no document {}')
            });
    return listings;
  }
}
