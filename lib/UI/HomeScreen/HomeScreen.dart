import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme(context).backgroundColor,
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
