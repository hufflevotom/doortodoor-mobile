import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UbicacionService extends ChangeNotifier {
  actualizarUbicacion(String id, String lat, String lng) async {
    try {
      await FirebaseDatabase.instance
          .ref()
          .child('responsables')
          .child(id)
          .update({
        'id': id,
        'lat': lat,
        'lng': lng,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
