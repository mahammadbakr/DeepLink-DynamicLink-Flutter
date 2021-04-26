import 'package:flutter/material.dart';


enum NavigationTab { home, search }

class AppSettingsProvider extends ChangeNotifier {
  bool isDarkMode = false;
  bool isWebViewShown = false;
  NavigationTab _navigationTab= NavigationTab.home;



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
