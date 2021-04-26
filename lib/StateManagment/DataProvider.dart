import 'package:flutter/material.dart';
import 'package:test_muhammad/Constants.dart';
import 'package:test_muhammad/Helpers/NITLHttp.dart';
import 'package:test_muhammad/Models/News.dart';

class DataProvider extends ChangeNotifier {
  final String getAllNewsURL = "${Constants.host}";

  List<dynamic> newsList = [];
  List<dynamic> searchedNewsList = [];

  Future<void> getAllNews() async {
    var response =
        await getNITLHttp(url: getAllNewsURL, body: {});
    if (response == null) {}
    print(response);
    newsList = response["data"].map((data) => News.fromJson(data)).toList();
    searchedNewsList = newsList;
    notifyListeners();
  }

  void searchForNews({String text}) {
    if (text == "" || text == null) {
      searchedNewsList = newsList;
    } else {
      var list = searchedNewsList.where((b) {
        return b.name.contains(text);
      }).toList();

      if(list.isEmpty){
        searchedNewsList = newsList;
        notifyListeners();
      }else{
        searchedNewsList=list;
      }
    }
    notifyListeners();
  }



}
