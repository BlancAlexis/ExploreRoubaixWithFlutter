import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/application/injections/initializer.dart';
import 'package:template_flutter_but/domain/entities/place.entity.dart';
import 'package:template_flutter_but/domain/repository/places.repository.dart';
import 'package:template_flutter_but/ui/abstraction/view_model_abs.dart';
import 'package:template_flutter_but/ui/screens/home/home.state.dart';

///
final StateNotifierProvider<HomeViewModel, HomeState> homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>(
  (StateNotifierProviderRef<HomeViewModel, HomeState> ref) => HomeViewModel(
    placesRepository: injector<PlacesRepository>(),
  ),
);

class HomeViewModel extends ViewModelAbs<HomeViewModel, HomeState> {
  final PlacesRepository _placesRepository;

  HomeViewModel({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(const HomeState.initial()) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init() async {
    // TODO - api call
    updateLoading(true);
    PlaceEntity placeEntity = await _placesRepository.getPlaces();
    state = state.copyWith(listPlace: placeEntity);
    updateLoading(false);
  }
}
