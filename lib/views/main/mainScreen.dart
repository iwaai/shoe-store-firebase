// packages
import 'package:flutter/material.dart';

// controllers

// screens
import './components/mainScreenBody.dart';

class mainScreen extends StatelessWidget {
  const mainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.grey, body: mainScreenBody());
  }
}
