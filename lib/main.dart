import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_muhammad/StateManagment/DataProvider.dart';
import 'package:test_muhammad/StateManagment/ThemeProvider.dart';
import 'Helpers/Theme.dart';
import 'StateManagment/AppSettingsProvider.dart';
import 'UI/HomeScreen/HomeScreen.dart';
import 'UI/SplashScreen/SplashScreen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppSettingsProvider>(
        create: (context) => AppSettingsProvider(),
      ),
      ChangeNotifierProvider<DataProvider>(
        create: (context) => DataProvider(),
      ),
      ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(ThemeMode.system),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      //Init Light Theme as initial theme for app
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: theme.getThemeMode(),
      title: 'NITL Test',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      //Use Named Routing between screens
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
