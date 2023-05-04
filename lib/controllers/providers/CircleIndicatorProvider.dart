import 'package:flutter/material.dart';

class circleIndicatorProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading {
    return _loading;
  }

  void SwitchCircleIndicator() {
    _loading = !_loading;
    notifyListeners();
  }
}
