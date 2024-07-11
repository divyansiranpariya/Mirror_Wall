import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int bottomindex = 0;

  void bottomNavigateration(int index) {
    bottomindex = index;
    notifyListeners();
  }
}
