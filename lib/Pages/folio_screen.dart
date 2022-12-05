import 'package:doortodoor_mobile/Interfaces/folio_interface.dart';
import 'package:doortodoor_mobile/Utils/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class FolioScreen extends StatelessWidget {
  const FolioScreen({super.key});

  Future<void> makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Folio;
    final String? phone = args.idDetalleCliente?.telefono!.split('/').first;
    final String inicio =
        '${args.idDetalleEntrega?.idHorarioVisita?.inicioVisita}'
            .padLeft(4, '0');
    final String fin =
        '${args.idDetalleEntrega?.idHorarioVisita?.finVisita}'.padLeft(4, '0');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Folio',
          style: CustomText.titulo5W,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.card_giftcard_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Información del folio',
                      style: CustomText.titulo_5,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Descripción: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text(
                              '${args.idDetallePedido?.descripcionPedido}',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fecha: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text('${args.idDetalleEntrega?.fechaEntrega}'
                                .split('T')
                                .first),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Local: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text(
                                '${args.idLocalAbastecimiento?.localAbastecimiento}'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Inicio: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text(
                                '${inicio.substring(0, 2)}:${inicio.substring(2)}'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fin: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text(
                                '${fin.substring(0, 2)}:${fin.substring(2)}'),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.account_circle_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Datos del Cliente',
                      style: CustomText.titulo_5,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doc. Identidad: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text('${args.idDetalleCliente?.dni}'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nombre: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text('${args.idDetalleCliente?.nombre}'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teléfono: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text('${args.idDetalleCliente?.telefono}'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Distrito: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                            child: Text(
                                '${args.idDetalleEntrega?.idUbicacionEntrega?.distrito}'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dirección: ',
                            style: CustomText.botones,
                          ),
                          Flexible(
                              child:
                                  Text('${args.idDetalleCliente?.direccion}')),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 20, left: 100, right: 70),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: CustomColors.gris_100,
              elevation: 0,
              color: CustomColors.verde_100,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Llamar',
                        style: TextStyle(color: CustomColors.blanco),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () async {
                if (phone != '') {
                  await makePhoneCall(phone!);
                } else {
                  notification(
                      message:
                          'No se registró un número de contacto para este folio',
                      context: context,
                      type: 'Error');
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20, left: 100, right: 70),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: CustomColors.gris_100,
              elevation: 0,
              color: CustomColors.azul_100,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: CustomColors.blanco,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Terminar la entrega',
                        style: TextStyle(color: CustomColors.blanco),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'finalizar', arguments: args);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 30, left: 100, right: 70),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledColor: CustomColors.gris_100,
              elevation: 0,
              color: CustomColors.rojo_100,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline_rounded,
                        color: CustomColors.blanco,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Reportar problema',
                        style: TextStyle(color: CustomColors.blanco),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'problema', arguments: args);
              },
            ),
          ),
        ],
      ),
    );
  }
}
