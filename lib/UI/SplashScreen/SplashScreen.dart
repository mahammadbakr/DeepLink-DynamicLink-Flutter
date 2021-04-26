import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_muhammad/Constants.dart';
import 'package:test_muhammad/StateManagment/DataProvider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // send request to API when the app starts ...
    Provider.of<DataProvider>(context, listen: false)
        .getAllNews();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        Constants.logoGif,
        height: 100,
      )),
    );
  }
}
