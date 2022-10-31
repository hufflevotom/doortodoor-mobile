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
                    const Icon(Icons.check_box_outline_blank_outlined),
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
                        children: [
                          Text(
                            'Descripción: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Fecha: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Local: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Inicio: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Fin: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
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
                        children: [
                          Text(
                            'Doc. Identidad: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Nombre: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Teléfono: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Distrito: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Dirección: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
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
                await makePhoneCall('123456789');
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
                //TODO: Terminar la entrega
                Navigator.pushNamed(context, 'finalizar');
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
                //TODO: Reportar problema
                Navigator.pushNamed(context, 'problema');
              },
            ),
          ),
        ],
      ),
    );
  }
}
