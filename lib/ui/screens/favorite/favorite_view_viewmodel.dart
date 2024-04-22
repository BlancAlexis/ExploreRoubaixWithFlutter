import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/domain/repository/local.repository.dart';

import '../../../application/injections/initializer.dart';
import '../../../data/Result.dart';
import '../../../domain/entities/result_entity.dart';
import '../../abstraction/view_model_abs.dart';
import 'favorite_view_state.dart';

final StateNotifierProvider<FavoritePlaceViewModel, FavoriteViewState>
    favoriteProvider =
    StateNotifierProvider<FavoritePlaceViewModel, FavoriteViewState>(
  (StateNotifierProviderRef<FavoritePlaceViewModel, FavoriteViewState> ref) =>
      FavoritePlaceViewModel(
    placesRepository: injector<PlacesLocalRepository>(),
  ),
);

class FavoritePlaceViewModel
    extends ViewModelAbs<FavoritePlaceViewModel, FavoriteViewState> {
  final PlacesLocalRepository _placesRepository;

  init() async {
    print('anjanj');
    await getFavoritePlaces();
  }

  Future<void> getFavoritePlaces() async {
    Result<List<ResultEntity>> result =
        await _placesRepository.getFavoritePlaces();
    if (result is Success) {
      var listFav = (result as Success<List<ResultEntity>>).data;
      if(listFav.isEmpty){
        state = FavoriteViewState.noFav();
      }
      else {
      state = state.copyWith(
          listrResultEntity: listFav,
          loading: false);
    }
    }
  }

  FavoritePlaceViewModel({required PlacesLocalRepository placesRepository})
      : _placesRepository = placesRepository,
        super(FavoriteViewState.initial());
}
