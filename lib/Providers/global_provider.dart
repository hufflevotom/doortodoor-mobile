import 'package:doortodoor_mobile/Interfaces/user_interface.dart';
import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  late User user;
  List folios = [];

  Future<void> setUser({required User newUser}) async {
    user = newUser;
    notifyListeners();
  }

  Future<void> setFolios({required List newFolios}) async {
    folios = newFolios;
    notifyListeners();
  }
}
