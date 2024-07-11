import 'package:flutter/material.dart';

class Searcheneprovider extends ChangeNotifier {
  String webcho = "Google ";
  String strGoogle = "Google";
  String strYahoo = "Yahoo";
  String strBing = "Bing";
  String strDuckDuckGo = "DuckDuckGo";
  String strMainURL = "https://www.google.com/";
  String strSearchURL = "https://www.google.com/search?q";
  void Changeengine(val, BuildContext context) {
    webcho = val;
    if (val == strGoogle) {
      strMainURL = "https://www.google.com/";
      strSearchURL = "https://www.google.com/search?q";
    } else if (val == strYahoo) {
      strMainURL = "https://in.search.yahoo.com";
      strSearchURL = "https://in.search.yahoo.com/search?q";
    } else if (val == strBing) {
      strMainURL = "https://www.bing.com";
      strSearchURL = "https://www.bing.com/search?q";
    } else if (val == strDuckDuckGo) {
      strMainURL = "https://duckduckgo.com";
      strSearchURL = "https://duckduckgo.com/search?q";
    }
    notifyListeners();
    Navigator.of(context).pop();
  }
}
