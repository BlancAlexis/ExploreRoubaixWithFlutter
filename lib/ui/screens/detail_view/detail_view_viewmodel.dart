import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/domain/repository/local.repository.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_state.dart';

import '../../../application/injections/initializer.dart';
import '../../../data/Result.dart';
import '../../../domain/entities/result_entity.dart';
import '../../abstraction/view_model_abs.dart';

final StateNotifierProvider<DetailViewViewModel, DetailViewState>
    detailProvider =
    StateNotifierProvider<DetailViewViewModel, DetailViewState>(
  (StateNotifierProviderRef<DetailViewViewModel, DetailViewState> ref) =>
      DetailViewViewModel(
    placesRepository: injector<PlacesLocalRepository>(),
  ),
);

class DetailViewViewModel
    extends ViewModelAbs<DetailViewViewModel, DetailViewState> {
  final PlacesLocalRepository _placesRepository;

  DetailViewViewModel({required PlacesLocalRepository placesRepository})
      : _placesRepository = placesRepository,
        super(DetailViewState.initial());

  init(ResultEntity resultEntity) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = state.copyWith(resultEntity: resultEntity);
    });
  }

  Future<void> putFavPlaces(ResultEntity resultEntity) async {
    Result<void> result =
        await _placesRepository.putFavoritePlaces(resultEntity);
    if (result is Success) {
      print('Success');
      return;
    } else {
      print("Error");
      return;
    }
  }

  Future<void> removeFavPlaces(ResultEntity resultEntity) async {
    Result<void> result =
        await _placesRepository.removeFavoritePlaces(resultEntity);
    if (result is Success) {
      print('Success');
      return;
    } else {
      print("Error");
      return;
    }
  }

  Future<void> choiceAction(ResultEntity resultEntity) async {
    if(resultEntity.isFav){
      removeFavPlaces(resultEntity);
    }
    else{
      putFavPlaces(resultEntity);
    }
  }


  }
