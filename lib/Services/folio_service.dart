import 'dart:convert';
import 'dart:io';
import 'package:doortodoor_mobile/Common/env.dart';
import 'package:doortodoor_mobile/Interfaces/finalizar_form_interface.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FolioService extends ChangeNotifier {
  late Finalizar finalizar;

  File? imgCliente;
  File? imgGuia;
  File? imgLugar;

  bool isSaving = false;

  obtenerFolios(String ruta) async {
    final url =
        Uri.https(EnvironmentVariables.baseUrl, '/document/folios/ruta/$ruta');
    final resp = await http.get(url);
    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    return decodeResp;
  }

  updateSelectedImage({required String tipo, required String path}) {
    if (tipo == 'Cliente') {
      imgCliente = File.fromUri(Uri(path: path));
    }
    if (tipo == 'Guia') {
      imgGuia = File.fromUri(Uri(path: path));
    }
    if (tipo == 'Lugar') {
      imgLugar = File.fromUri(Uri(path: path));
    }

    notifyListeners();
  }

  Future<Map<String, dynamic>?> uploadImages() async {
    if (imgCliente == null || imgGuia == null || imgLugar == null) return null;

    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/djgenjb9l/image/upload?upload_preset=uzguu8e0');

    final requestCliente = http.MultipartRequest('POST', url);
    final fileCliente =
        await http.MultipartFile.fromPath('file', imgCliente!.path);
    requestCliente.files.add(fileCliente);
    final streamCliente = await requestCliente.send();
    final respCliente = await http.Response.fromStream(streamCliente);

    final requestGuia = http.MultipartRequest('POST', url);
    final fileGuia = await http.MultipartFile.fromPath('file', imgGuia!.path);
    requestGuia.files.add(fileGuia);
    final streamGuia = await requestGuia.send();
    final respGuia = await http.Response.fromStream(streamGuia);

    final requestLugar = http.MultipartRequest('POST', url);
    final fileLugar = await http.MultipartFile.fromPath('file', imgLugar!.path);
    requestLugar.files.add(fileLugar);
    final streamLugar = await requestLugar.send();
    final respLugar = await http.Response.fromStream(streamLugar);

    if (respCliente.statusCode != 200 && respCliente.statusCode != 201) {
      return null;
    }
    if (respGuia.statusCode != 200 && respGuia.statusCode != 201) {
      return null;
    }
    if (respLugar.statusCode != 200 && respLugar.statusCode != 201) {
      return null;
    }

    imgCliente = null;
    imgGuia = null;
    imgLugar = null;

    final decodedCliente = json.decode(respCliente.body);
    final decodedGuia = json.decode(respGuia.body);
    final decodedLugar = json.decode(respLugar.body);
    return {
      'imgCliente': decodedCliente['secure_url'],
      'imgGuia': decodedGuia['secure_url'],
      'imgLugar': decodedLugar['secure_url'],
    };
  }

  saveEvidencia(
      {required Finalizar finalizar,
      required String idResponsable,
      required String idFolio,
      String? latitudFinal,
      String? longitudFinal}) async {
    late Map<String, dynamic> bodyData;
    final url = Uri.https(EnvironmentVariables.baseUrl, '/document/evidencias');

    final List<Map<String, dynamic>> imagenes = [
      {
        "idTipoFoto": "60beeeb5030b61001519db57",
        "urlFoto": finalizar.imgCliente
      },
      {"idTipoFoto": "60beeec7030b61001519db59", "urlFoto": finalizar.imgGuia},
      {"idTipoFoto": "60beeebc030b61001519db58", "urlFoto": finalizar.imgLugar}
    ];

    bodyData = {
      'idResponsable': idResponsable,
      'idFolio': idFolio,
      'idEstado': finalizar.estado,
      'imagenes': imagenes
    };

    final resp = await http.post(url, body: json.encode(bodyData), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    final decodedData = json.decode(resp.body);
    return decodedData['statusCode'] == 201 | 200;
  }

  saveJustificacion(
      {required Finalizar finalizar,
      required String idResponsable,
      required String idFolio,
      String? latitudFinal,
      String? longitudFinal}) async {
    late Map<String, dynamic> bodyData;
    final url = Uri.https(EnvironmentVariables.baseUrl, '/document/evidencias');
    bodyData = {
      'idResponsable': idResponsable,
      'idFolio': idFolio,
      'idEstado': finalizar.estado,
      'justificacion': finalizar.justificacion,
    };
    final resp = await http.post(url, body: json.encode(bodyData), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final decodedData = json.decode(resp.body);
    return decodedData['statusCode'] == 201 | 200;
  }

  saveReportar(
      {required String justificacion,
      required String idResponsable,
      required String idFolio}) async {
    late Map<String, dynamic> bodyData;
    final url = Uri.https(
        EnvironmentVariables.baseUrl, '/document/evidencias/reportar');
    bodyData = {
      'idResponsable': idResponsable,
      'idFolio': idFolio,
      'justificacion': justificacion,
    };
    final resp = await http.post(url, body: json.encode(bodyData), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final decodedData = json.decode(resp.body);
    return decodedData['statusCode'] == 201 | 200;
  }
}
