import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/application/injections/initializer.dart';
import 'package:template_flutter_but/ui/abstraction/view_model_abs.dart';
import 'package:template_flutter_but/ui/place_entity_singleton.dart';

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

  MapsViewModel({required PlaceEntitySingleton placeEntitySingleton})
      : placeEntitySingleton = placeEntitySingleton,
        super(const MapsState.initial()) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init() async {
    updateLoading(true);
    placeEntitySingleton.dataStream.listen((event) {
      state = state.copyWith(listPlace: event);
    });
    updateLoading(false);
  }
}
