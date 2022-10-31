import 'package:doortodoor_mobile/Utils/Styles/custom_colors.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputStyle({
    required String hintText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: CustomColors.gris_100,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: CustomColors.naranja_100,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: CustomColors.rojo_100,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: CustomColors.rojo_100,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      hintText: hintText,
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: CustomColors.gris_100,
            )
          : null,
    );
  }
}
