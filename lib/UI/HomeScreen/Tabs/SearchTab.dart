import 'dart:math';

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
                appSettings.isSearchClicked = true;
              });
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: SearchBar(),
            ),
          ),
          ! appSettings.isSearchClicked
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Search Results: "),
                                      Text(
                                        dataList.searchWord,
                                        style: theme(context)
                                            .textTheme
                                            .button
                                            .copyWith(fontSize: 18,color: theme(context).highlightColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      _getARowDetail(
                                          label: "Results",
                                          num: dataList.searchedNewsList.length
                                              .toString()),
                                      _getARowDetail(
                                          label: "Timelines",
                                          num: Random()
                                              .nextInt(20)
                                              .toString()
                                              .toString()),
                                      _getARowDetail(
                                          label: "Debates",
                                          num: Random()
                                              .nextInt(20)
                                              .toString()
                                              .toString()),
                                      _getARowDetail(
                                          label: "Quiz",
                                          num: Random()
                                              .nextInt(20)
                                              .toString()
                                              .toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: dataList.searchedNewsList.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    child: ListTile(
                                      title: Text(
                                        dataList.searchedNewsList[i].title,
                                        style: theme(context)
                                            .textTheme
                                            .button
                                            .copyWith(
                                                color:
                                                    theme(context).primaryColor,
                                                fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      leading: Image.network(dataList
                                          .searchedNewsList[i].imageURL,height: 40,width: 40,),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ))
        ],
      ),
    );

    //USING FUTURE BUILDER
    // return FutureBuilder(
    //   future: Provider.of<DataProvider>(context, listen: false).getAllNews(),
    //   builder: (context, snapshot) => snapshot.connectionState ==
    //           ConnectionState.waiting
    //       ? Center(child: CircularProgressIndicator())
    //       : body()
    // );
  }

  Widget _getARowDetail({String label, String num}) {
    return Row(
      children: [
        Text(
          Random().nextInt(20).toString(),
          style: theme(context)
              .textTheme
              .caption
              .copyWith(fontSize: 16, color: theme(context).highlightColor),
        ),
        SizedBox(
          width: 4,
        ),
        Text(label,
            style: theme(context)
                .textTheme
                .button
                .copyWith(fontSize: 14, color: theme(context).highlightColor)),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
