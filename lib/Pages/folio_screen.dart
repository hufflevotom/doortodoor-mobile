import 'package:flutter/material.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';

class FolioScreen extends StatelessWidget {
  const FolioScreen({super.key});

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
        child: Column(),
      ),
    );
  }
}
