import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
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
  final _clusterManager = ClusterManager<Marker>(
    [], // Replace with your initial markers (empty list for now)
    _markerClusterBuilder,
  );

  Marker _markerClusterBuilder(int clusterSize) {
    return Marker(
      markerId: MarkerId('cluster-$clusterSize'),
      position: LatLng(0, 0), // Placeholder position, replaced later
      icon: Icon(
        Icons.pin,
        color: Colors.blue,
        size: clusterSize == 1 ? 30 : clusterSize * 10,
      ),
      infoWindow: InfoWindow(
        title: Text('Cluster: $clusterSize'),
      ),
    );
  }
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
