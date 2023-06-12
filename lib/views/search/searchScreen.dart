// packages
import 'package:flutter/material.dart';

// controllers

// screens
//widgets
import './components/seachScreenBody.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: seacrhScreenBody());
  }
}
