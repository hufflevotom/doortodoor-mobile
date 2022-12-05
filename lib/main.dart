import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:doortodoor_mobile/Utils/preferences/local_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doortodoor_mobile/Pages/pages.dart';
import 'package:doortodoor_mobile/Services/services.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(AppState(preferences: sharedPreferences));
}

class AppState extends StatelessWidget {
  const AppState({super.key, required this.preferences});
  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => FolioService()),
        ChangeNotifierProvider(create: (_) => GlobalProvider()),
        Provider(create: (_) => LocalPreferences(preferences)),
      ],
      builder: (context, _) {
        return const MyApp();
      },
      // child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<LocalPreferences>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salvatore App',
      initialRoute: preferences.tokenUser == '' || preferences.tokenUser == null
          ? 'login'
          : 'home',
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
