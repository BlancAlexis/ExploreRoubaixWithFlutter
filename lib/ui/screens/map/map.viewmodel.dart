import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:template_flutter_but/application/injections/initializer.dart';
import 'package:template_flutter_but/ui/abstraction/view_model_abs.dart';
import 'package:template_flutter_but/ui/place_entity_singleton.dart';

import '../../../domain/entities/place.entity.dart';
import 'map.state.dart';

///
final StateNotifierProvider<MapsViewModel, MapsState> mapsProvider =
    StateNotifierProvider<MapsViewModel, MapsState>(
  (StateNotifierProviderRef<MapsViewModel, MapsState> ref) => MapsViewModel(
    placeEntitySingleton: injector<PlaceEntitySingleton>(),
  ),
);

class MapsViewModel extends ViewModelAbs<MapsViewModel, MapsState> {
  final PlaceEntitySingleton placeEntitySingleton;

  MapsViewModel({required this.placeEntitySingleton})
      : super(MapsState.initial()) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init() async {
    updateLoading(true);
    state = state.copyWith(
      loading: false,
      listPlace: placeEntitySingleton.places,
      markers: updateMarkers(placeEntitySingleton.places),
    );
    placeEntitySingleton.dataStream.listen((PlaceEntity event) {
      state = state.copyWith(
        listPlace: event,
        markers: updateMarkers(event),
      );
    });
    updateLoading(false);
  }

  List<Marker>? updateMarkers(PlaceEntity places) {
    final markers = places.details.map((place) => Marker(
            markerId: MarkerId(place.monumHisComId.toString()),
            position: place.geoPoint2D,
            infoWindow: InfoWindow(title: place.appellationCourante)))
        .toList();
    return markers;
  }
}
