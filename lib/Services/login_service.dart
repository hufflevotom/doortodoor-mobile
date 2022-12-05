import 'dart:convert';
import 'package:doortodoor_mobile/Common/env.dart';
import 'package:doortodoor_mobile/Interfaces/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService extends ChangeNotifier {
  Future<Map<String, dynamic>?> login(
      String docIdentidad, String password) async {
    final Map<String, dynamic> bodyData = {
      'documento': docIdentidad,
      'contrasena': password
    };
    final url = Uri.https(EnvironmentVariables.baseUrl, '/auth/login');
    final resp = await http.post(url, body: bodyData);
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    if (decodeResp['user']['_id'] != null) {
      if (decodeResp['user']['idTipoRol'] == '60bb0fad68bcb70590c9eccd') {
        if (decodeResp['user']['idVehiculo'] != null) {
          return {
            'user': decodeResp['user'],
            'token': decodeResp['access_token'],
            'errorMessage': null
          };
        } else {
          return {'errorMessage': 'No se han planificado entregas'};
        }
      } else {
        return {'errorMessage': 'No es repartidor'};
      }
    } else {
      return {'errorMessage': decodeResp['message']};
    }
  }

  Future<User?> user(String token) async {
    final url = Uri.https(
        EnvironmentVariables.baseUrl, '/auth/login/token', {'token': token});
    final resp = await http.get(url);
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    if (decodeResp['user']['_id'] != null) {
      return User.fromJson(decodeResp['user']);
    } else {
      return null;
    }
  }
}
