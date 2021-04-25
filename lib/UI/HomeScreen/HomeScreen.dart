import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_muhammad/StateManagment/AppSettingsProvider.dart';
import 'package:test_muhammad/UI/HomeScreen/Tabs/HomeTab.dart';
import 'package:test_muhammad/UI/HomeScreen/Tabs/SearchTab.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<AppSettingsProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: theme(context).backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: theme(context).backgroundColor,
          selectedItemColor: Colors.black,
          selectedLabelStyle:
              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          unselectedItemColor: theme(context).accentColor.withOpacity(0.4),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          iconSize: 60,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: upperContainer(
                  enabled: settings.getNavigationTab() == NavigationTab.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: upperContainer(
                  enabled: settings.getNavigationTab() == NavigationTab.search),
              label: 'Search',
            ),
          ],
          currentIndex: settings.getNavigationTab().index,
          onTap: (index) {
            setState(() {
              settings.setNavigationTab(
                  index == 0 ? NavigationTab.home : NavigationTab.search);
              print( settings.getNavigationTab().toString());
            });
          },
        ),
        body: settings.getNavigationTab() == NavigationTab.home
            ? HomeTab()
            : SearchTab());
  }

  Widget upperContainer({bool enabled}) {
    return Container(
      color: enabled
          ? theme(context).accentColor
          : theme(context).accentColor.withOpacity(0.3),
      height: 1,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    );
  }
}
