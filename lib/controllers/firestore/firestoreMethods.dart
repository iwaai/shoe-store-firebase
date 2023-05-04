// packages
import 'package:flutter/services.dart' as the_bundle;
import '../../models/maleShoe.dart';
import 'package:firebase_auth/firebase_auth.dart';
// controllers

// screens

class firestoreMethods {
  Future<List<maleShoe>> getfromdb() async {
    final data =
        await the_bundle.rootBundle.loadString("lib/models/dummyProducts.json");
    final children = maleShoeFromJson(data);

    return children;
  }

  Future<maleShoe> getsingleShoeMale(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("lib/models/dummyProducts.json");
    final children = maleShoeFromJson(data);
    final singleShoeMale = children.firstWhere((element) => element.id == id);

    return singleShoeMale;
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
}
