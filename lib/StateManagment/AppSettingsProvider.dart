import 'package:flutter/material.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';


enum NavigationTab { home, search }

class AppSettingsProvider extends ChangeNotifier {
  bool isDarkMode = false;
  bool isWebViewShown = false;
  bool isSearchClicked = false;
  NavigationTab _navigationTab= NavigationTab.home;

// search States
  void setSearchOn() {
    isSearchClicked = true;
    notifyListeners();
  }

  void setSearchOff() {
    isSearchClicked = false;
    notifyListeners();
  }



  // Home Navigation Tabs
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


  //Dark&Light Mode
  void setModeDark() {
    isDarkMode = true;
    notifyListeners();
  }

  void setModeLight() {
    isDarkMode = false;
    notifyListeners();
  }

  bool getDarkMode() {
    if (isDarkMode == null) {
      isDarkMode = false;
    }
    return isDarkMode;
  }




  //WebView Enabled or Not
  void hideWebView() {
    isWebViewShown = false;
    notifyListeners();
  }

  void showWebView() {
    isWebViewShown = true;
    notifyListeners();
  }

  bool getWebViewShown() {
    if (isWebViewShown == null) {
      isWebViewShown = false;
    }
    return isWebViewShown;
  }





}
