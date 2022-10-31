import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:doortodoor_mobile/Utils/Widgets/widgets.dart';

class RutaScreen extends StatefulWidget {
  const RutaScreen({super.key});

  @override
  State<RutaScreen> createState() => _RutaScreenState();
}

class _RutaScreenState extends State<RutaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ruta de entrega',
          style: CustomText.titulo5W,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          //TODO: itemCount: folios.length,
          itemCount: 8,
          itemBuilder: (context, index) {
            return FolioCard(
              estado: 'pendiente',
              onTap: () {
                print(index);
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
                          const Icon(Icons.check_box_outline_blank_outlined),
                          const SizedBox(width: 10),
                          Text(
                            'folios[index].idFolio',
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
                            'folios[index].cliente',
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
                            'folios[index].direccion',
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
                        '${index + 1}',
                        style: CustomText.botones,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
