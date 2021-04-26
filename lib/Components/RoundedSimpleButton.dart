import 'package:flutter/cupertino.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';

class RoundedSimpleButton extends StatelessWidget {
  final String label;
  // final bool enabled;
  final Function onPressed;

  RoundedSimpleButton({this.label, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 15, vertical: 5),
        width: 150,
        decoration: BoxDecoration(
            color: theme(context).buttonColor,
            borderRadius: BorderRadius.circular(18)),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: theme(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
