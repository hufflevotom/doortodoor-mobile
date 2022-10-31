import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';

class ProblemaScreen extends StatelessWidget {
  const ProblemaScreen({super.key});

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
                'Problema',
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
                  value: 'Seleccione',
                  items: const [
                    DropdownMenuItem(
                      value: 'Seleccione',
                      child: Text('Seleccione'),
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
                'Motivo',
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
                  labelText: 'Describa el problema',
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
    );
  }
}
