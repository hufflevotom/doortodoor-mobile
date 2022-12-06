// ignore_for_file: avoid_print, no_logic_in_create_state, use_build_context_synchronously

import 'package:doortodoor_mobile/Interfaces/finalizar_form_interface.dart';
import 'package:doortodoor_mobile/Interfaces/folio_interface.dart';
import 'package:doortodoor_mobile/Providers/finalizar_form_provider.dart';
import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:doortodoor_mobile/Services/folio_service.dart';
import 'package:doortodoor_mobile/Utils/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FinalizarScreen extends StatelessWidget {
  const FinalizarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Folio;
    final finalizarService = Provider.of<FolioService>(context);
    return ChangeNotifierProvider(
        create: (_) => FinalizarFormProvider(Finalizar(
              estado: '638d0c4d9a3096d13d7e2c1e',
              imgCliente: '',
              imgGuia: '',
              imgLugar: '',
            )),
        child: _FinalizarForm(finalizarService: finalizarService, args: args));
  }
}

class _FinalizarForm extends StatefulWidget {
  const _FinalizarForm({
    Key? key,
    required this.finalizarService,
    required this.args,
  }) : super(key: key);

  final FolioService finalizarService;
  final Folio args;

  @override
  State<_FinalizarForm> createState() =>
      _FinalizarFormState(finalizarService: finalizarService, args: args);
}

class _FinalizarFormState extends State<_FinalizarForm> {
  _FinalizarFormState({
    required this.finalizarService,
    required this.args,
  }) : super();

  final FolioService finalizarService;
  final Folio args;

  String estado = '638d0c4d9a3096d13d7e2c1e';
  XFile? imgCliente;
  XFile? imgGuia;
  XFile? imgLugar;

  @override
  Widget build(BuildContext context) {
    var finalizarForm = Provider.of<FinalizarFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terminar la entrega',
          style: CustomText.titulo5W,
        ),
      ),
      body: Form(
        key: finalizarForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Estado de la entrega',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    hint: const Text('Seleccione'),
                    value: estado,
                    onChanged: (value) {
                      finalizarForm.values.estado = value.toString();
                      setState(() {
                        estado = value.toString();
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: '638d0c4d9a3096d13d7e2c1e',
                        child: Text('Entregado'),
                      ),
                      DropdownMenuItem(
                        value: '638d0c479a3096d13d7e2c1c',
                        child: Text('No entregado'),
                      ),
                      DropdownMenuItem(
                        value: '638d0c3e9a3096d13d7e2c1a',
                        child: Text('No cargado'),
                      ),
                    ],
                  ),
                ),
                if (estado == '638d0c4d9a3096d13d7e2c1e')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        'Evidencias de entrega',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final picker = ImagePicker();
                            final XFile? pickedFile = await picker.pickImage(
                                source: ImageSource.gallery,
                                // source: ImageSource.camera,
                                imageQuality: 100);

                            if (pickedFile == null) {
                              return;
                            }

                            finalizarForm.values.imgCliente = pickedFile.path;
                            setState(() {
                              imgCliente = pickedFile;
                            });

                            finalizarService.updateSelectedImage(
                                tipo: 'Cliente', path: pickedFile.path);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: imgCliente == null
                                ? CustomColors.gris_100
                                : CustomColors.verde_100,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.photo),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Foto del cliente',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final picker = ImagePicker();
                            final XFile? pickedFile = await picker.pickImage(
                                source: ImageSource.gallery,
                                // source: ImageSource.camera,
                                imageQuality: 100);

                            if (pickedFile == null) {
                              return;
                            }
                            finalizarForm.values.imgGuia = pickedFile.path;
                            setState(() {
                              imgGuia = pickedFile;
                            });

                            finalizarService.updateSelectedImage(
                                tipo: 'Guia', path: pickedFile.path);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: imgGuia == null
                                ? CustomColors.gris_100
                                : CustomColors.verde_100,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.photo),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Foto de la guía',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            final picker = ImagePicker();
                            final XFile? pickedFile = await picker.pickImage(
                                source: ImageSource.gallery,
                                // source: ImageSource.camera,
                                imageQuality: 100);

                            if (pickedFile == null) {
                              return;
                            }
                            finalizarForm.values.imgLugar = pickedFile.path;
                            setState(() {
                              imgLugar = pickedFile;
                            });

                            finalizarService.updateSelectedImage(
                                tipo: 'Lugar', path: pickedFile.path);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: imgLugar == null
                                ? CustomColors.gris_100
                                : CustomColors.verde_100,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.photo),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Foto del lugar',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                if (estado != '638d0c4d9a3096d13d7e2c1e')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        'Justificación de entrega',
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
                          finalizarForm.values.justificacion = value.toString();
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Justificación',
                          labelStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final idResponsable =
                          context.read<GlobalProvider>().getUser;
                      if (finalizarForm.isValidForm()) {
                        if (estado == '638d0c4d9a3096d13d7e2c1e') {
                          final Map<String, dynamic>? imageUrl =
                              await finalizarService.uploadImages();
                          if (imageUrl != null) {
                            finalizarForm.values.imgCliente =
                                imageUrl['imgCliente'];
                            finalizarForm.values.imgGuia = imageUrl['imgGuia'];
                            finalizarForm.values.imgLugar =
                                imageUrl['imgLugar'];

                            final resEvidencia =
                                await finalizarService.saveEvidencia(
                                    finalizar: finalizarForm.values,
                                    idResponsable:
                                        idResponsable!.idResponsable!,
                                    idFolio: args.sId!);
                            await finalizarService
                                .obtenerFolios(idResponsable.ruta!);
                            if (resEvidencia) {
                              Navigator.pushNamed(context, 'home');
                            }
                          } else {
                            notification(
                                message: 'No se pudo subir las imágenes',
                                context: context,
                                type: 'Error');
                          }
                        } else {
                          final resEvidencia =
                              await finalizarService.saveJustificacion(
                                  finalizar: finalizarForm.values,
                                  idResponsable: idResponsable!.idResponsable!,
                                  idFolio: args.sId!);
                          await finalizarService
                              .obtenerFolios(idResponsable.ruta!);
                          if (resEvidencia) {
                            Navigator.pushNamed(context, 'home');
                          }
                        }
                      } else {
                        notification(
                            message: 'Debe completar todos los campos',
                            context: context,
                            type: 'Error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: finalizarForm.isValidForm()
                          ? CustomColors.azul_100
                          : CustomColors.gris_100,
                    ),
                    child: const Text(
                      'Finalizar la entrega',
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
