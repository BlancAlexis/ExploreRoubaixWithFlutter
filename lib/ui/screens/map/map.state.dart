import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:template_flutter_but/ui/abstraction/view_state_abs.dart';

import '../../../domain/entities/place.entity.dart';

part 'map.state.g.dart';

@CopyWith()
class MapsState extends ViewStateAbs {
  final bool loading;
  final PlaceEntity? listPlace;
  final List<Marker> markers;

  const MapsState({required this.loading, required this.listPlace, required this.markers});

  const MapsState.initial(this.markers)
      : loading = false,
        listPlace = null;

  @override
  List<Object?> get props => <Object?>[
        loading,
        listPlace,
      ];
}
