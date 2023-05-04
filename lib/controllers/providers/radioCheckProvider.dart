import 'package:flutter/material.dart';

class radioCheckProvider with ChangeNotifier {
  bool _remember = false;
  bool get remember {
    return _remember;
  }

  void rememberAlt(bool val) {
    _remember = !_remember;
    notifyListeners();
  }
}
