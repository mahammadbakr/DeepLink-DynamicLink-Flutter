import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';

class MainAppButton extends StatelessWidget {
  final String label;

  // final bool enabled;
  final Function onPressed;

  MainAppButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Text(
          label,
          textAlign: TextAlign.center,
          style: theme(context).textTheme.button,
        )),
        height: width / 5,
        width: width / 2,
        decoration: BoxDecoration(
            color: theme(context).buttonColor,
            borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
