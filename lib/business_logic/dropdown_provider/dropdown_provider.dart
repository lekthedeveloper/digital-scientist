import 'package:flutter/material.dart';

class DropDownProvider with ChangeNotifier {
  String condition = '';

  changetoTrue(String value) {
    condition = '';
    notifyListeners();
  }

  clearValue() {
    condition = '';
    notifyListeners();
  }
}
