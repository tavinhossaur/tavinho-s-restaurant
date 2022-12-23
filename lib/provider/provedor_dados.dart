import 'package:flutter/cupertino.dart';

class ProvedorDados extends ChangeNotifier {
  int itemCount = 0;

  void count(bool increment) {
    if (increment) {
      ++itemCount;
    } else {
      --itemCount;
    }
    notifyListeners();
  }
}
