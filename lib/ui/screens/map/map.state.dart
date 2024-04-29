import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';
import 'package:template_flutter_but/ui/abstraction/view_state_abs.dart';

import '../../../domain/entities/place.entity.dart';

part 'map.state.g.dart';

@CopyWith()
class MapsState extends ViewStateAbs {
  final LatLng roubaixLatLng = const LatLng(50.69421, 3.17456);

  final bool loading;
  final List<ResultEntity> listPlace;
  final List<Marker> markers;

  const MapsState({
    required this.loading,
    required this.listPlace,
    required this.markers,
  });

  MapsState.initial()
      : loading = false,
        listPlace = <ResultEntity>[],
        markers = const <Marker>[];

  MapsState copyWith({
    bool? loading,
    List<ResultEntity>? listPlace,
    List<Marker>? markers,
  }) =>
      MapsState(
        loading: this.loading,
        listPlace: this.listPlace,
        markers: this.markers,
      );

  @override
  List<Object?> get props => <Object?>[loading, listPlace, markers];
}
