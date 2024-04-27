import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/application/injections/initializer.dart';
import 'package:template_flutter_but/ui/abstraction/view_model_abs.dart';
import 'package:template_flutter_but/ui/place_entity_singleton.dart';
import 'package:template_flutter_but/ui/screens/home/home.state.dart';

///
final StateNotifierProvider<HomeViewModel, HomeState> homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>(
  (StateNotifierProviderRef<HomeViewModel, HomeState> ref) => HomeViewModel(
    placeEntitySingleton: injector<PlaceEntitySingleton>(),
  ),
);

class HomeViewModel extends ViewModelAbs<HomeViewModel, HomeState> {
  final PlaceEntitySingleton placeEntitySingleton;
  int maxIndex = 0;

  HomeViewModel({required this.placeEntitySingleton})
      : super(const HomeState.initial()) {
    _init();
  }

  void loadMore() {
    placeEntitySingleton.g(maxIndex);
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init() async {
    updateLoading(true);
    placeEntitySingleton.dataStream.listen((event) {
      maxIndex = event.details.length;
      state = state.copyWith(listPlace: event);
    });
    updateLoading(false);
  }
}
