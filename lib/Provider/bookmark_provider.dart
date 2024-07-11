import 'package:flutter/material.dart';

import '../utils/globaldata.dart';

class Deleteprovider extends ChangeNotifier {
  void deleteAll() {
    Book.urls.clear();
    Book.urldata.clear();
    notifyListeners();
  }

  void delete(int index) {
    Book.urls.remove(Book.urldata[index]);
    Book.urldata.removeAt(index);
    notifyListeners();
  }
}
