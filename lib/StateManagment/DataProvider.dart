import 'package:flutter/material.dart';
import 'package:test_muhammad/Constants.dart';
import 'package:test_muhammad/Helpers/NITLHttp.dart';
import 'package:test_muhammad/Models/News.dart';

class DataProvider extends ChangeNotifier {

  String searchWord ="";

  List<dynamic> newsList = [];
  List<dynamic> searchedNewsList = [];


  void setSearchWord({String text}){
    searchWord = text;
    notifyListeners();
  }
  // Fetch all Data News

  Future<void> getAllNews() async {

    var response = await getNITLHttp(url: "${Constants.host}", body: {});
    if (response == null) {}
    // print(response);
    newsList = response["data"].map((data) => News.fromJson(data)).toList();
    searchedNewsList = newsList;
    notifyListeners();
  }


  // Search in Network Data using new requests

  Future<void> getNetworkSearchNews({String text}) async {
    if (text == "" || text == null) {
      searchedNewsList = newsList;
      searchWord = text;
      notifyListeners();
    } else {
      var response = await getNITLHttp(
          url: "${Constants.host}?query=$text", body: {});
      if (response == null) {}
      // print(response);
      searchedNewsList =
          response["data"].map((data) => News.fromJson(data)).toList();
      searchWord = text;
      notifyListeners();
    }
  }

  // Search in Local Data without new request

  // void localSearchForNews({String text}) {
  //   if (text == "" || text == null) {
  //     searchedNewsList = newsList;
  //   } else {
  //     var list = searchedNewsList.where((b) {
  //       return b.title.contains(text);
  //     }).toList();
  //
  //     if (list.isEmpty) {
  //       searchedNewsList = newsList;
  //       notifyListeners();
  //     } else {
  //       searchedNewsList = list;
  //     }
  //   }
  //   notifyListeners();
  // }


}
