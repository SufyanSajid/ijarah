import 'package:flutter/material.dart';

class App with ChangeNotifier {
  int bottomBarIndex = 0;

  void setIndex(int value) {
    bottomBarIndex = value;
    notifyListeners();
  }
}
