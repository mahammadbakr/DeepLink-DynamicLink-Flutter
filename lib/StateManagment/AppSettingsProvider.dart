import 'package:flutter/material.dart';


enum NavigationTab { home, search }

class AppSettingsProvider extends ChangeNotifier {

  int tabHome= 0;
  NavigationTab _navigationTab= NavigationTab.home;

  void setHomeTab(int tab) {
    tabHome = tab;
    notifyListeners();
  }

  int getHomeTab() {
    if (tabHome == null) {
      tabHome = 0;
    }
    return tabHome;
  }

  void setNavigationTab(NavigationTab navTab) {
    _navigationTab = navTab;
    notifyListeners();
  }

  NavigationTab getNavigationTab() {
    if (_navigationTab == null) {
      _navigationTab = NavigationTab.home;
    }
    return _navigationTab;
  }

}
