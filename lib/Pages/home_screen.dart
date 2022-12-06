// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:doortodoor_mobile/Pages/card_folio_screen.dart';
import 'package:doortodoor_mobile/Pages/map_box_screen.dart';
import 'package:doortodoor_mobile/Services/ubicacion_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:doortodoor_mobile/Utils/preferences/local_preferences.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:doortodoor_mobile/Interfaces/user_interface.dart';
import 'package:doortodoor_mobile/Services/folio_service.dart';
import 'package:doortodoor_mobile/Services/login_service.dart';
import 'package:doortodoor_mobile/Providers/global_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedStyle = 'mapbox/dark-v10';
  // String selectedStyle = 'ckwp8d95g2hhy15ohwuo0a8os';

  // final oscuroStyle = 'mapbox://styles/hufflevotom/ckwp8plz811tt14qjsrcyjfpy';
  final streetStyle = 'mapbox/dark-v10';

  // void _onStyleLoaded() {
  //   addImageFromAsset("assetImage", "lib/Utils/Images/Ubicacion.png");
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initData();
    });
  }

  void _initData() async {
    final preferences = Provider.of<LocalPreferences>(context, listen: false);
    final loginService = Provider.of<LoginService>(context, listen: false);
    final folioService = Provider.of<FolioService>(context, listen: false);

    if (preferences.tokenUser == '' || preferences.tokenUser == null) {
      Navigator.pushReplacementNamed(context, 'login');
    } else {
      final User? newUser = await loginService.user(preferences.tokenUser!);
      if (newUser != null) {
        context.read<GlobalProvider>().setUser(newUser: newUser);
        if (newUser.ruta != null) {
          final folioArr = await folioService.obtenerFolios(newUser.ruta!);
          context.read<GlobalProvider>().setFolios(newFolios: folioArr['body']);
        }
        _initLocationService();
      }
    }
  }

  void _initLocationService() async {
    final globalProvider = Provider.of<GlobalProvider>(context, listen: false);
    final ubicacionService = Provider.of<UbicacionService>(
      context,
      listen: false,
    );
    final location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }

    final address = await location.getLocation();
    globalProvider.setUbiUser(LatLng(address.latitude!, address.longitude!));

    final idResponsable = globalProvider.getUser?.idResponsable;
    final idFolio = globalProvider.getFolios.first['_id'];
    // Agregar o actualizar ubicacion
    final response = await ubicacionService.actualizarUbicacion(
      idResponsable!,
      address.latitude!.toString(),
      address.longitude!.toString(),
      idFolio,
    );
    print('Respuesta Ubicacion: ${response}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: CustomColors.naranja_100.withOpacity(0.7)),
        child: SafeArea(
          child: Stack(
            children: [
              PaintMap(
                selectedStyle: selectedStyle,
              ),
              Positioned.fill(
                bottom: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      disabledColor: CustomColors.gris_100,
                      elevation: 0,
                      color: CustomColors.naranja_100,
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        child: Center(
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: CustomColors.blanco,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'sesion');
                      },
                    ),
                    const Spacer(),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30))),
                      disabledColor: CustomColors.gris_100,
                      elevation: 0,
                      color: CustomColors.naranja_100,
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 15),
                        child: Center(
                          child: Icon(
                            Icons.alt_route_rounded,
                            color: CustomColors.blanco,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'ruta');
                      },
                    ),
                  ],
                ),
              ),
              const CardFolioScreen(),
            ],
          ),
        ),
      ),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Símbolos
        // FloatingActionButton(
        //     child: Icon(Icons.sentiment_very_dissatisfied),
        //     onPressed: () {
        //       mapController?.addSymbol(SymbolOptions(
        //           geometry: center,
        //           iconSize: 2,
        //           iconImage: 'assetImage',
        //           textField: 'Montaña creada aquí',
        //           textOffset: Offset(0, 2)));
        //     }),

        // SizedBox(height: 5),

        // ZoomIn
        // FloatingActionButton(
        //     child: Icon(Icons.zoom_in),
        //     onPressed: () {
        //       mapController?.animateCamera(CameraUpdate.zoomIn());
        //     }),

        // SizedBox(height: 5),

        // ZoomOut
        // FloatingActionButton(
        //     child: Icon(Icons.zoom_out),
        //     onPressed: () {
        //       mapController?.animateCamera(CameraUpdate.zoomOut());
        //     }),

        // SizedBox(height: 5),

        // Cambiar Estilos
        Container(
          padding: const EdgeInsets.only(top: 130),
          child: FloatingActionButton(
              backgroundColor: CustomColors.azul_100,
              elevation: 4,
              child: Icon(
                Icons.map_outlined,
                color: CustomColors.blanco,
              ),
              onPressed: () {
                // if (selectedStyle == oscuroStyle) {
                selectedStyle = streetStyle;
                // } else {
                //   selectedStyle = oscuroStyle;
                // }
                setState(() {});
              }),
        )
      ],
    );
  }
}
