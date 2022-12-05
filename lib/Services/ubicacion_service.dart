import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UbicacionService extends ChangeNotifier {
  actualizarUbicacion(String id, String lat, String lng) async {
    try {
      final reference =
          FirebaseDatabase.instance.ref().child('responsables').child(id);
      final data = await reference.get();
      if (data.exists) {
        reference.update({
          'lat': lat,
          'lng': lng,
        });
      } else {
        reference.set({
          'lat': lat,
          'lng': lng,
        });
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
