// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:doortodoor_mobile/Interfaces/user_interface.dart';

class GlobalProvider extends ChangeNotifier {
  User? _user;
  List _folios = [];

  User? get getUser => _user;
  bool get existUser => _user != User() ? true : false;

  List get getFolios => _folios;
  bool get existFolios => _folios.isNotEmpty ? true : false;

  Future<void> setUser({required User newUser}) async {
    _user = newUser;
    notifyListeners();
  }

  Future<void> setFolios({required List newFolios}) async {
    List arrFolios = newFolios;
    _folios = arrFolios;
    notifyListeners();
  }
}
