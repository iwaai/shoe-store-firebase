import 'package:flutter/material.dart';

class pageswitch with ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  void swithPage(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
