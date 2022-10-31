import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';

class FinalizarScreen extends StatelessWidget {
  const FinalizarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terminar la entrega',
          style: CustomText.titulo5W,
        ),
      ),
      body: Container(
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
                  value: 'Entregado',
                  items: const [
                    DropdownMenuItem(
                      value: 'Entregado',
                      child: Text('Entregado'),
                    ),
                    DropdownMenuItem(
                      value: 'No entregado',
                      child: Text('No entregado'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.verde_100,
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.gris_100,
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.gris_100,
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
              const SizedBox(height: 15),
              const Text(
                'Justificación de entrega',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                minLines: 6,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Justificación',
                  labelStyle: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.azul_100,
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
    );
  }
}
