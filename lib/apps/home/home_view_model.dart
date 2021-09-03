
import 'package:flutter/cupertino.dart';

// ViewModel for HomeVie: Contains logic of the HomeView
class HomeChangeNotifier extends ChangeNotifier {
  // Counter
  int increment = 0;

  // Method to increment counter
  Future<void> reloadState() async {
    increment++;
    notifyListeners();
  }
}