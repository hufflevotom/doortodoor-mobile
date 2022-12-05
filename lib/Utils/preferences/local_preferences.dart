import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  final String _tokenUser = '';
  final SharedPreferences _sharedPreferences;
  LocalPreferences(this._sharedPreferences);

  void setTokenUser(String token) {
    _sharedPreferences.setString(_tokenUser, token);
  }

  String? get tokenUser => _sharedPreferences.getString(_tokenUser);

  void removeTokenUser() {
    _sharedPreferences.remove(_tokenUser);
  }
}
