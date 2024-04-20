import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:template_flutter_but/ui/screens/map/map.state.dart';
import 'package:template_flutter_but/ui/screens/map/map.viewmodel.dart';

import '../detail_view/detail_view_screen.dart';

class MapSample extends ConsumerStatefulWidget {
  const MapSample({super.key});

  @override
  ConsumerState<MapSample> createState() => MapSampleState();
}

class MapSampleState extends ConsumerState<MapSample> {
  final double startZoom = 13.0;
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mapsProvider);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: state.markers.mapIndexed((index, marker) => newMarkers(marker, state, index)).toSet(),
        initialCameraPosition: CameraPosition(target: state.roubaixLatLng, zoom: startZoom),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }


  Marker newMarkers(Marker e, MapsState state, int index) {
    return Marker(
        markerId: e.markerId,
        position: e.position,
        infoWindow: e.infoWindow,
        onTap: () =>
        {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) =>
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailViewScreen(
                        resultEntity: state.listPlace!.details![index]),
                  ],
                ),
          )
        });
  }
}