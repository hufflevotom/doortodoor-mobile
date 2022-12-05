import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UbicacionService extends ChangeNotifier {
  Future<bool> actualizarUbicacion(
    String id,
    String lat,
    String lng,
    String idFolio,
  ) async {
    try {
      final reference =
          FirebaseDatabase.instance.ref().child('responsables').child(id);
      final data = await reference.get();
      print('data: ${data.exists}');
      if (data.exists) {
        reference.update({
          'lat': lat,
          'lng': lng,
          'folio': idFolio,
        });
      } else {
        reference.set({
          'lat': lat,
          'lng': lng,
          'folio': idFolio,
        });
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
