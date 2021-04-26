import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_muhammad/Helpers/DynamicLinksService.dart';
import 'package:test_muhammad/StateManagment/AppSettingsProvider.dart';
import 'package:test_muhammad/UI/HomeScreen/Tabs/HomeTab.dart';
import 'package:test_muhammad/UI/HomeScreen/Tabs/SearchTab.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> setupDeepLink() async {
    await createDeepLink();
    var link = await FirebaseDynamicLinks.instance.getInitialLink();
    await handleDeepLink(link);
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      await handleDeepLink(dynamicLink);
    });
  }

  Future<void> handleDeepLink(PendingDynamicLinkData data) async {
    final Uri uri = data?.link;
    if (uri != null) {
      setState(() {
        Provider.of<AppSettingsProvider>(context, listen: false)
            .setNavigationTab(NavigationTab.search);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 0), () async {
      await setupDeepLink();
    });
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<AppSettingsProvider>(context);
    return Scaffold(
        backgroundColor: theme(context).backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: theme(context).backgroundColor,
          selectedItemColor: theme(context).highlightColor,
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
              print(settings.getNavigationTab().toString());
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
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
    );
  }
}
