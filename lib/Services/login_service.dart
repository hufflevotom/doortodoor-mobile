import 'dart:convert';
import 'package:doortodoor_mobile/interfaces/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService extends ChangeNotifier {
  final String _baseUrl = 'salvatore-backend.herokuapp.com';

  Future<Map<String, dynamic>?> login(
      String docIdentidad, String password) async {
    final Map<String, dynamic> bodyData = {
      'dni': docIdentidad,
      'contrasena': password
    };
    final url = Uri.https(_baseUrl, '/v1/usuario/sesion');
    final resp = await http.post(url, body: bodyData);
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    if (decodeResp['type'] == 'success') {
      if (decodeResp['data']['idTipoRol'] == '60bb0fad68bcb70590c9eccd') {
        return {'id': decodeResp['data']['_id'], 'errorMessage': null};
      } else {
        return {'errorMessage': 'No es repartidor'};
      }
    } else {
      return {'errorMessage': decodeResp['message']};
    }
  }

  Future<User?> user(String id) async {
    final url = Uri.https(_baseUrl, '/v1/usuario/$id');
    final resp = await http.get(url);
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    if (decodeResp['_id'] != null) {
      return User.fromJson(decodeResp);
    } else {
      return null;
    }
  }
}
