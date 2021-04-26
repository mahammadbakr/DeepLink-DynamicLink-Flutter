import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_muhammad/Components/MainAppButton.dart';
import 'package:test_muhammad/Components/SearchBar.dart';
import 'package:test_muhammad/StateManagment/AppSettingsProvider.dart';
import 'package:test_muhammad/Components/RoundedSimpleButton.dart';
import 'package:test_muhammad/StateManagment/DataProvider.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  bool isSearchEnabled = false;

  @override
  Widget build(BuildContext context) {
    var appSettings = Provider.of<AppSettingsProvider>(context, listen: false);
    // var dataSettings = Provider.of<DataProvider>(context, listen: false);

    return SafeArea(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSearchEnabled = true;
              });
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: SearchBar(),
            ),
          ),
          !isSearchEnabled
              ? appSettings.getWebViewShown()
              ? Expanded(
            child: Stack(
              children: [
                WebView(
                  initialUrl: 'https://nitl.app/',
                  javascriptMode: JavascriptMode.unrestricted,
                ),
                Positioned(
                    top: 10,
                    right: 20,
                    child: RoundedSimpleButton(
                      label: "Hide Webview",
                      onPressed: () {
                        setState(() {
                          appSettings.hideWebView();
                        });
                      },
                    ))
              ],
            ),
          )
              : Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3),
            child: MainAppButton(
              label: "Open a Webview",
              onPressed: () {
                setState(() {
                  appSettings.showWebView();
                });
              },
            ),
          )
              : Consumer<DataProvider>(
              builder: (_, dataList, __) => Expanded(
                child: ListView.builder(
                  itemCount: dataList.searchedNewsList.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(dataList.searchedNewsList[i].title),
                    );
                  },
                ),
              ))
        ],
      ),
    );
    // return FutureBuilder(
    //   future: Provider.of<DataProvider>(context, listen: false).getAllNews(),
    //   builder: (context, snapshot) => snapshot.connectionState ==
    //           ConnectionState.waiting
    //       ? Center(child: CircularProgressIndicator())
    //       :
    // );
  }
}
