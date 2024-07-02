import 'package:flutter/material.dart';

class TreatmentProvider extends ChangeNotifier {
  final String _treatment = "";
  String get treatment => _treatment;

  void changeTreatment() {}
}
