import 'dart:convert';
import 'package:doortodoor_mobile/Common/env.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FolioService extends ChangeNotifier {
  Future<String?> obtenerFolios() async {
    final url = Uri.https(EnvironmentVariables.baseUrl, '/document/folios');
    final resp = await http.get(url);
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);
    return null;
  }
}
