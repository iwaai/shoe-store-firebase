// packages
import 'package:flutter/material.dart';

// controllers

// screens

class addScreen extends StatelessWidget {
  const addScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Text(
          "this is add",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
