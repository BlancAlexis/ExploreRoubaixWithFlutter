import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/domain/repository/local.repository.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_state.dart';

import '../../../application/injections/initializer.dart';
import '../../../data/Result.dart';
import '../../../domain/entities/result_entity.dart';
import '../../abstraction/view_model_abs.dart';

final StateNotifierProvider<DetailViewViewModel, DetailViewState> detailProvider =
StateNotifierProvider<DetailViewViewModel, DetailViewState>(
      (StateNotifierProviderRef<DetailViewViewModel, DetailViewState> ref) => DetailViewViewModel(
        placesRepository: injector<PlacesLocalRepository>(),
      ),
);

class DetailViewViewModel extends ViewModelAbs<DetailViewViewModel, DetailViewState> {
  final PlacesLocalRepository _placesRepository;

  init(ResultEntity resultEntity) {
    state = state.copyWith(resultEntity: resultEntity);
  }

  Future<List<ResultEntity>> getFavoritePlaces() async {
    Result<List<ResultEntity>> result = await _placesRepository.getFavoritePlaces();
    if(result is Success) {
      return (result as Success<List<ResultEntity>>).data;
    } else {
   //   print(${(result as Error).exception});
      return [];
    }
  }

  void putFavPlaces(ResultEntity resultEntity) async {
    Result<void> result = await _placesRepository.putFavoritePlaces(resultEntity);
    if(result is Success) {
      print('Success');
      return ;
    } else {
        print("Error");
      return ;
    }
  }
    DetailViewViewModel({required PlacesLocalRepository placesRepository})
    : _placesRepository = placesRepository,
    super(DetailViewState.initial());

//  DetailViewViewModel() : super(DetailViewState.initial());
}