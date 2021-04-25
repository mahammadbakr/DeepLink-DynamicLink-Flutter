import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  //Light Color Constants
  static const primaryColor = const Color(0xff39fEF9);
  static const accentColor = const Color(0xff2F486D);
  static const backgroundColor = const Color(0xFFf2f2f2);
  static const interactionColor = const Color(0xFFFADF56);

  //Dark Color Constants
  static const darkPrimaryColor = const Color(0xff242526);
  static const darkAccentColor = const Color(0xfffefefe);
  static const darkBackgroundColor = const Color(0xFFf2f2f2);
  static const darkInteractionColor = const Color(0xFFFADF56);

  //Other Color Constant
  static const white = const Color(0xffffffff);
  static const black = const Color(0xff000000);
  static const successColor = const Color(0xff7BE495);
  static const warningColor = const Color(0xffFFCF5C);
  static const errorColor = const Color(0xffF75010);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: white,
    backgroundColor: backgroundColor,
    primaryColor: primaryColor,
    accentColor: accentColor,
    textTheme: lightTextTheme,
    primarySwatch: Colors.yellow,
    buttonColor: Colors.yellow.shade600,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: black),
      color: primaryColor,
      textTheme: lightTextTheme,
      elevation: 1,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: accentColor,
      unselectedLabelColor: accentColor.withOpacity(0.5),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    backgroundColor: darkBackgroundColor,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
    textTheme: darkTextTheme,
    primarySwatch: Colors.yellow,
    buttonColor: Colors.yellow.shade300,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: white),
      color: darkPrimaryColor,
      textTheme: darkTextTheme,
      elevation: 1,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: darkAccentColor,
      unselectedLabelColor: darkAccentColor.withOpacity(0.5),
    ),
  );

  // Light Text Theme
  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headline1.copyWith(color: AppTheme.black),
    headline2: _headline2.copyWith(color: AppTheme.black),
    headline3: _headline3.copyWith(color: AppTheme.black),
    headline4: _headline4.copyWith(color: AppTheme.black),
    headline5: _headline5.copyWith(color: AppTheme.black),
    headline6: _headline6.copyWith(color: AppTheme.black),
    subtitle1: _thin1.copyWith(color: AppTheme.black),
    subtitle2: _thin2.copyWith(color: AppTheme.black),
    bodyText1: _bodyText1.copyWith(color: AppTheme.black),
    bodyText2: _bodyText2.copyWith(color: AppTheme.black),
    button: _button.copyWith(color: AppTheme.black),
    caption: _caption.copyWith(color: AppTheme.black),
    overline: _overline.copyWith(color: AppTheme.black),
  );

  // Dark Text Theme
  static final TextTheme darkTextTheme = TextTheme(
    headline1: _headline1.copyWith(color: AppTheme.white),
    headline2: _headline2.copyWith(color: AppTheme.white),
    headline3: _headline3.copyWith(color: AppTheme.white),
    headline4: _headline4.copyWith(color: AppTheme.white),
    headline5: _headline5.copyWith(color: AppTheme.white),
    headline6: _headline6.copyWith(color: AppTheme.white),
    subtitle1: _thin1.copyWith(color: AppTheme.white),
    subtitle2: _thin2.copyWith(color: AppTheme.white),
    bodyText1: _bodyText1.copyWith(color: AppTheme.white),
    bodyText2: _bodyText2.copyWith(color: AppTheme.white),
    button: _button.copyWith(color: AppTheme.white),
    caption: _caption.copyWith(color: AppTheme.white),
    overline: _overline.copyWith(color: AppTheme.white),
  );

  static final TextStyle _headline1 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 60,
  );
  static final TextStyle _headline2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 48,
  );
  static final TextStyle _headline3 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 34,
  );
  static final TextStyle _headline4 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 28,
  );
  static final TextStyle _headline5 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
  );
  static final TextStyle _headline6 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static final TextStyle _thin1 = TextStyle(
    fontWeight: FontWeight.w100,
    fontSize: 28,
  );
  static final TextStyle _thin2 = TextStyle(
    fontWeight: FontWeight.w100,
    fontSize: 22,
  );

  static final TextStyle _bodyText1 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static final TextStyle _bodyText2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );
  static final TextStyle _button = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  static final TextStyle _caption = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
  static final TextStyle _overline = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 8,
  );
}
