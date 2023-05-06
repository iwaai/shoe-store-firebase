// packages
import 'package:flutter/services.dart' as the_bundle;
import '../../models/maleShoe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';
// controllers

// screens

class firestoreMethods {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

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

  // upload prouducts to db
  Future<void> uploadProducttodb({
    required String pname,
    required String pcategory,
    required List<String> pimageurls,
    required String poldPrice,
    required List<dynamic> psizes,
    required String pnewprce,
    required String pdescription,
    required String ptitle,
  }) async {
    maleShoe product = maleShoe(
        id: Random().nextInt(100).toString(),
        name: pname,
        category: pcategory,
        imageUrl: pimageurls,
        oldPrice: poldPrice,
        sizes: psizes,
        price: pnewprce,
        description: pdescription,
        title: ptitle);
    print(product.toJson());
    firebaseFirestore.collection("products").doc().set(product.toJson());
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
}
