// packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../utitlities/Utils.dart';
// controllers
import '../providers/CircleIndicatorProvider.dart';

// screens
import '../../views/home/homeScreen.dart';

class authenticationMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> SignIn({
    required String email,
    required String password,
    required BuildContext ctx,
  }) async {
    Provider.of<circleIndicatorProvider>(ctx, listen: false)
        .SwitchCircleIndicator();
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.push(
          ctx, MaterialPageRoute(builder: (context) => homeScreen()));
      Provider.of<circleIndicatorProvider>(ctx, listen: false)
          .SwitchCircleIndicator();
    }).onError((error, stackTrace) {
      utils().ShowMsg(error.toString());
      Provider.of<circleIndicatorProvider>(ctx, listen: false)
          .SwitchCircleIndicator();
    });
  }
}
