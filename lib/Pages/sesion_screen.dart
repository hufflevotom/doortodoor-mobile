import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';

class SesionScreen extends StatelessWidget {
  const SesionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalles de sesión',
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
                    const Icon(Icons.account_circle_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Datos del usuario',
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
                            'Apellidos: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Celular: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Brevete: ',
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
                    const Icon(Icons.help_outline),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Vehículo asignado',
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
                            'Modelo: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Placa: ',
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
            const SizedBox(
              height: 35,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.help_outline),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Ruta',
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
                            'Local de origen: ',
                            style: CustomText.botones,
                          ),
                          const Text('data'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Ruta: ',
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
                        Icons.logout,
                        color: CustomColors.blanco,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Cerrar sesión',
                        style: TextStyle(color: CustomColors.blanco),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {
                //TODO: Destruir sesión
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          )
        ],
      ),
    );
  }
}