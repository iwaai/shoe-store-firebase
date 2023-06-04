import 'package:flutter/material.dart';
import 'package:shoe_firebase/controllers/firestore/firestoreMethods.dart';
import '../models/maleShoe.dart';
class ShoeMaleProvider with ChangeNotifier{
  //products
  late  Future<List<maleShoe>> _shoemale = firestoreMethods().getfromfirebase();

  //getterproducts
  Future<List<maleShoe>> get shoemale{
    return _shoemale;
  }

}