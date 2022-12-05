import 'package:doortodoor_mobile/Interfaces/folio_interface.dart';
import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:doortodoor_mobile/Utils/Widgets/widgets.dart';
import 'package:provider/provider.dart';

class RutaScreen extends StatefulWidget {
  const RutaScreen({super.key});

  @override
  State<RutaScreen> createState() => _RutaScreenState();
}

class _RutaScreenState extends State<RutaScreen> {
  @override
  Widget build(BuildContext context) {
    GlobalProvider global = context.watch<GlobalProvider>();

    var folios = global.getFolios;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ruta de entrega',
          style: CustomText.titulo5W,
        ),
      ),
      body: global.existFolios
          ? Container(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: folios.length,
                itemBuilder: (context, index) {
                  return FolioCard(
                    estado: 'pendiente',
                    onTap: () {
                      //TODO: setear datos del folio
                      Navigator.pushNamed(context, 'folio',
                          arguments: Folio.fromJson(folios[index]));
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.card_giftcard_outlined),
                                const SizedBox(width: 10),
                                Text(
                                  folios[index]['numeroFolio'],
                                  style: CustomText.botones,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.account_circle_outlined),
                                const SizedBox(width: 10),
                                Text(
                                  folios[index]['idDetalleCliente']['nombre'],
                                  style: CustomText.botones,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.pin_drop_outlined),
                                const SizedBox(width: 10),
                                Text(
                                  folios[index]['idDetalleEntrega']
                                      ['idUbicacionEntrega']['distrito'],
                                  style: CustomText.cuerpoPequeno,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              folios[index]['idDetalleEntrega']['ordenEntrega']
                                  .toString(),
                              style: CustomText.botones,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          : const Center(
              child: Text(
              'No hay datos de ruta\n Contáctese con el personal \nadministrativo',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
    );
  }
}
