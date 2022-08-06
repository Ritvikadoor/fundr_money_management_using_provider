import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndexNotifier = 0;
  int updatedIndex = 0;
  int get fetchCurrentIndex {
    return selectedIndexNotifier;
  }

  void updateScreenIndex(int newIndex) {
    selectedIndexNotifier = newIndex;
    notifyListeners();
  }
}
