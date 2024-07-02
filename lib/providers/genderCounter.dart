import 'package:flutter/material.dart';

class GenderProvider extends ChangeNotifier {
  int _male = 0;
  int _female = 0;

  int get male => _male;
  int get female => _female;

  void incrementMale() {
    _male++;
    notifyListeners();
  }

  void incrementFemale() {
    _female++;
    notifyListeners();
  }

  void decrementMale() {
    if (_male > 0) {
      _male--;
    }
    notifyListeners();
  }

  void decrementFemale() {
    if (_female > 0) {
      _female--;
    }
    notifyListeners();
  }
}
