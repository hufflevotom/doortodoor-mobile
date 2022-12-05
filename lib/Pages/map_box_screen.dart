import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

class PaintMap extends StatelessWidget {
  const PaintMap({
    Key? key,
    required this.selectedStyle,
    required this.onMapCreated,
  }) : super(key: key);
  final String selectedStyle;
  final void Function(MapboxMapController)? onMapCreated;

  @override
  Widget build(BuildContext context) {
    const center = LatLng(-12.2277325, -76.8618111);
    final globalProvider = Provider.of<GlobalProvider>(context, listen: true);

    return MapboxMap(
      accessToken:
          'sk.eyJ1IjoiaHVmZmxldm90b20iLCJhIjoiY2t3cGJwbGw2MGI0eTJubnppNnR6a2VuMiJ9.fgSLZx6wPQPqAL_pHGsoRQ',
      styleString: selectedStyle,
      //onMapCreated: onMapCreated,
      onMapCreated: (controller) {
        if (globalProvider.ubicationUser != null) {
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: globalProvider.ubicationUser!,
                zoom: 5,
              ),
            ),
          );
        }
      },
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
      initialCameraPosition: const CameraPosition(
        target: center,
        zoom: 20,
      ),
      // Agregar markers
    );
  }
}
