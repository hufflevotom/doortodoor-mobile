import 'package:flutter/material.dart';

class ReportarFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String justificacion = '';

  ReportarFormProvider(values);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    bool result = false;
    if (justificacion != '') {
      result = true;
    }
    return result;
  }
}
