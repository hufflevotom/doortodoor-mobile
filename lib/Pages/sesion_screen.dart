import 'package:doortodoor_mobile/Interfaces/user_interface.dart';
import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:doortodoor_mobile/Utils/preferences/local_preferences.dart';
import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:provider/provider.dart';

class SesionScreen extends StatelessWidget {
  const SesionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalProvider global = context.watch<GlobalProvider>();
    LocalPreferences preferences = context.watch<LocalPreferences>();
    var user = global.existUser ? global.getUser : null;
    late String modelo;
    late String placa;
    late String ruta;
    if (user != null) {
      modelo = user.idVehiculo!.modelo!;
      placa = user.idVehiculo!.placa!;
      ruta = user.ruta!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalles de sesión',
          style: CustomText.titulo5W,
        ),
      ),
      body: global.existUser
          ? UserInfo(user: user, modelo: modelo, placa: placa, ruta: ruta)
          : const Center(
              child: Text(
              'No hay datos de sesión',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
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
                preferences.removeTokenUser();
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
          )
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
    required this.modelo,
    required this.placa,
    required this.ruta,
  }) : super(key: key);

  final User? user;
  final String? modelo;
  final String? placa;
  final String? ruta;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        Text(user!.dni!),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Nombre: ',
                          style: CustomText.botones,
                        ),
                        Text(user!.nombre!),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Apellidos: ',
                          style: CustomText.botones,
                        ),
                        Text(user!.apellidos!),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Celular: ',
                          style: CustomText.botones,
                        ),
                        Text(user!.celular!),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Brevete: ',
                          style: CustomText.botones,
                        ),
                        Text(user!.brevete!),
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
          if (user!.idVehiculo != null)
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.directions_car_filled_outlined),
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
                              Text('$modelo'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Placa: ',
                                style: CustomText.botones,
                              ),
                              Text('$placa'),
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
                        const Icon(Icons.route_outlined),
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
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Local de origen: ',
                          //       style: CustomText.botones,
                          //     ),
                          //     Text(user.nombre!),
                          //   ],
                          // ),
                          // const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Ruta: ',
                                style: CustomText.botones,
                              ),
                              Text('$ruta'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          else
            Column(
              children: const [
                SizedBox(height: 50),
                Text(
                  'No se ecuentra información \nregistrada sobre el vehículo o \nla ruta para hoy.\n\n Contáctese con el personal \nadministrativo',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
        ],
      ),
    );
  }
}
