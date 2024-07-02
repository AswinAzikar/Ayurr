import 'package:flutter/material.dart';

class GenderProvider extends ChangeNotifier {
  int male, female;

  GenderProvider({this.male = 0, this.female = 0});

  void maleincrementCounter() {
    male++;
    notifyListeners();
  }

  void femaleincrementCounter() {
    female++;
    notifyListeners();
  }

  void maledecrementCounter() {
    if (male > 0) {
      male--;
    } else {
      male = 0;
    }
    notifyListeners();
  }

  void femaledecrementCounter() {
    if (female > 0) {
      female--;
    } else {
      female = 0;
    }
    notifyListeners();
  }
}
