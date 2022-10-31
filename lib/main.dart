import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doortodoor_mobile/Pages/pages.dart';
import 'package:doortodoor_mobile/Services/services.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salvatore App',
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreen(),
        'home': (_) => const HomeScreen(),
        'sesion': (_) => const SesionScreen(),
        'ruta': (_) => const RutaScreen(),
        'folio': (_) => const FolioScreen(),
        'problema': (_) => const ProblemaScreen(),
        'finalizar': (_) => const FinalizarScreen(),
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: CustomColors.naranja_100,
          ),
          fontFamily: 'Quicksand'),
    );
  }
}
