import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:template_flutter_but/ui/abstraction/view_state_abs.dart';

import '../../../domain/entities/place.entity.dart';

part 'map.state.g.dart';

@CopyWith()
class MapsState extends ViewStateAbs {
  final LatLng roubaixLatLng = const LatLng(50.69421, 3.17456);

  final bool loading;
  final PlaceEntity? listPlace;
  final List<Marker> markers;


  const MapsState({
    required this.loading,
    required this.listPlace,
    required this.markers,
  });

  MapsState.initial()
      : loading = false,
        listPlace = null,
        markers = const <Marker>[];

  MapsState copyWith({
    bool? loading,
    PlaceEntity? listPlace,
    List<Marker>? markers,
  }) =>
      MapsState(
        loading: loading ?? this.loading,
        listPlace: listPlace ?? this.listPlace,
        markers: markers ?? this.markers,
      );

  @override
  List<Object?> get props => <Object?>[loading, listPlace, markers];
}
