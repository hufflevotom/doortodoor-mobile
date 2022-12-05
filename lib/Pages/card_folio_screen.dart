import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:doortodoor_mobile/Utils/Styles/custom_colors.dart';
import 'package:doortodoor_mobile/Utils/Widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';

class CardFolioScreen extends StatefulWidget {
  const CardFolioScreen({Key? key}) : super(key: key);

  @override
  State<CardFolioScreen> createState() => _CardFolioScreenState();
}

class _CardFolioScreenState extends State<CardFolioScreen> {
  String _direccion = '';

  void getAddressFromLatLong(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    final direction =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      _direccion = direction;
    });
  }

  @override
  Widget build(BuildContext context) {
    final folios = context.watch<GlobalProvider>().getFolios;
    if (folios.isNotEmpty) {
      final folioActual = folios.first;
      final latitud =
          folioActual['idDetalleEntrega']['idUbicacionEntrega']['latitud'];

      final longitud =
          folioActual['idDetalleEntrega']['idUbicacionEntrega']['longitud'];

      getAddressFromLatLong(double.parse(latitud), double.parse(longitud));

      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 25),
            child: CustomCard(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Doc. Identidad: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.negro_100,
                        ),
                      ),
                      Text(folioActual['idDetalleCliente']['dni'] ?? ''),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nombre: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.negro_100,
                        ),
                      ),
                      Text(folioActual['idDetalleCliente']['nombre'] ?? ''),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Teléfono: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.negro_100,
                        ),
                      ),
                      Text(folioActual['idDetalleCliente']['telefono'] ?? ''),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Distrito: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.negro_100,
                        ),
                      ),
                      Text(folioActual['idDetalleEntrega']['idUbicacionEntrega']
                              ['distrito'] ??
                          ''),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dirección: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.negro_100,
                        ),
                      ),
                      Expanded(child: Text(_direccion)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
