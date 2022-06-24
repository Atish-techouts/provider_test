import 'package:flutter/material.dart';

class DemoProvider extends ChangeNotifier {
  bool loggedIn = false;

  void updateLog() {
    loggedIn = !loggedIn;
    print('Updating');
    notifyListeners();
  }
}
