import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  Map<String, dynamic> user = {};
  List folios = [];

  Future<void> setUser({required Map<String, dynamic> newUser}) async {
    user = newUser;
    notifyListeners();
  }

  Future<void> setFolios({required List newFolios}) async {
    folios = newFolios;
    notifyListeners();
  }
}
