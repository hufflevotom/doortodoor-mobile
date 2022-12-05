// ignore_for_file: no_logic_in_create_state, use_build_context_synchronously

import 'package:doortodoor_mobile/Interfaces/folio_interface.dart';
import 'package:doortodoor_mobile/Interfaces/reportar_form_interface.dart';
import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:doortodoor_mobile/Providers/reportar_form_provider.dart';
import 'package:doortodoor_mobile/Services/folio_service.dart';
import 'package:doortodoor_mobile/Utils/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:provider/provider.dart';

class ProblemaScreen extends StatelessWidget {
  const ProblemaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Folio;
    final reportarService = Provider.of<FolioService>(context);
    return ChangeNotifierProvider(
        create: (_) => ReportarFormProvider(Reportar(
              available: false,
              justificacion: '',
            )),
        child: _ReportarForm(reportarService: reportarService, args: args));
  }
}

class _ReportarForm extends StatefulWidget {
  const _ReportarForm({
    Key? key,
    required this.reportarService,
    required this.args,
  }) : super(key: key);

  final FolioService reportarService;
  final Folio args;

  @override
  State<_ReportarForm> createState() =>
      _ReportarFormState(reportarService: reportarService, args: args);
}

class _ReportarFormState extends State<_ReportarForm> {
  _ReportarFormState({
    required this.reportarService,
    required this.args,
  }) : super();

  final FolioService reportarService;
  final Folio args;

  @override
  Widget build(BuildContext context) {
    var reportarForm = Provider.of<ReportarFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reportar problema',
          style: CustomText.titulo5W,
        ),
      ),
      body: Form(
        key: reportarForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Motivo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (value) {
                    reportarForm.justificacion = value.toString();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Describa el problema',
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final idResponsable =
                          context.read<GlobalProvider>().getUser;
                      if (reportarForm.isValidForm()) {
                        final resEvidencia = await reportarService.saveReportar(
                            justificacion: reportarForm.justificacion,
                            idResponsable: idResponsable!.idResponsable!,
                            idFolio: args.sId!);
                        await reportarService
                            .obtenerFolios(idResponsable.ruta!);
                        if (resEvidencia) {
                          Navigator.pushNamed(context, 'home');
                        }
                      } else {
                        notification(
                            message: 'Debe completar todos los campos',
                            context: context,
                            type: 'Error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.naranja_100,
                    ),
                    child: const Text(
                      'Registrar problema',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
