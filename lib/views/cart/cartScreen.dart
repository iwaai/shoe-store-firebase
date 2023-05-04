// packages
import 'package:flutter/material.dart';

// controllers

// screens

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "this is cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
