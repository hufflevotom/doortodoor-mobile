import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';

class PaintMap extends StatelessWidget {
  const PaintMap({
    Key? key,
    required this.selectedStyle,
  }) : super(key: key);
  final String selectedStyle;

  @override
  Widget build(BuildContext context) {
    final globalProvider = Provider.of<GlobalProvider>(context, listen: true);
    final LatLng? center = globalProvider.ubicationUser;

    return FlutterMap(
      options: MapOptions(
          center: LatLng(-12.051694, -77.034589),
          zoom: 10,
          maxZoom: 18,
          minZoom: 5),
      nonRotatedChildren: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
          additionalOptions: {
            'accessToken':
                'sk.eyJ1IjoiaHVmZmxldm90b20iLCJhIjoiY2t3cGJwbGw2MGI0eTJubnppNnR6a2VuMiJ9.fgSLZx6wPQPqAL_pHGsoRQ',
            'id': selectedStyle,
          },
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: center!,
              builder: (_) {
                return Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  // child: Icon(
                  //   Icons.location_on,
                  //   color: Colors.red,
                  //   size: 40,
                  // ),
                );
              },
            ),
          ],
        )
      ],
    );
    // MapboxMap(
    //   accessToken:
    //       'sk.eyJ1IjoiaHVmZmxldm90b20iLCJhIjoiY2t3cGJwbGw2MGI0eTJubnppNnR6a2VuMiJ9.fgSLZx6wPQPqAL_pHGsoRQ',
    //   styleString: selectedStyle,
    //   //onMapCreated: onMapCreated,
    //   onMapCreated: (controller) {
    //     if (globalProvider.ubicationUser != null) {
    //       controller.addSymbols([
    //         SymbolOptions(
    //           geometry: globalProvider.ubicationUser,
    //           // iconImage: "lib/Utils/Images/Ubicacion.png",
    //           iconSize: 2,
    //         ),
    //       ]);
    //       controller.animateCamera(
    //         CameraUpdate.newCameraPosition(
    //           CameraPosition(
    //             target: globalProvider.ubicationUser!,
    //             zoom: 5,
    //           ),
    //         ),
    //       );
    //     }
    //   },
    //   compassEnabled: true,
    //   myLocationEnabled: true,
    //   myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
    //   initialCameraPosition: const CameraPosition(
    //     target: center,
    //     zoom: 20,
    //   ),
    //   // Agregar markers
    // );
  }
}
