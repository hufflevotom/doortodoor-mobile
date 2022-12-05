import 'package:doortodoor_mobile/Interfaces/finalizar_form_interface.dart';
import 'package:flutter/material.dart';

class FinalizarFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Finalizar values = Finalizar(
    available: false,
    estado: '638d0c4d9a3096d13d7e2c1e',
    imgCliente: '',
    imgGuia: '',
    imgLugar: '',
  );

  FinalizarFormProvider(values);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    bool result = false;
    if (values.estado == '638d0c4d9a3096d13d7e2c1e') {
      if (values.imgCliente != '' &&
          values.imgGuia != '' &&
          values.imgLugar != '') {
        result = true;
      }
    } else {
      if (values.justificacion != null && values.justificacion != '') {
        result = true;
      }
    }
    return result;
  }
}
