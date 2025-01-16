import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int currentIndex = 0;

  void navigateTo(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
