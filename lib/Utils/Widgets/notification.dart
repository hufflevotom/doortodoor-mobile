import 'dart:async';

import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';

ScaffoldMessengerState notification(
    {required String message, dynamic context, String type = 'Info'}) {
  Color color;
  IconData icon;

  switch (type) {
    case 'Error':
      color = CustomColors.rojo_100;
      icon = Icons.error;
      break;
    case 'Warning':
      color = CustomColors.amarillo_100;
      icon = Icons.warning;
      break;
    case 'Success':
      color = CustomColors.verde_100;
      icon = Icons.check_circle;
      break;
    default:
      color = CustomColors.azul_100;
      icon = Icons.info;
      ;
  }

  return ScaffoldMessenger.of(context)
    ..removeCurrentMaterialBanner()
    ..showMaterialBanner(
      MaterialBanner(
        backgroundColor: color,
        content: Text(message, style: TextStyle(color: CustomColors.blanco)),
        actions: [
          TextButton(
            child: Icon(icon, color: CustomColors.blanco),
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          )
        ],
        onVisible: () {
          Timer(
              const Duration(seconds: 2),
              () =>
                  ScaffoldMessenger.of(context).removeCurrentMaterialBanner());
        },
      ),
    );
}
