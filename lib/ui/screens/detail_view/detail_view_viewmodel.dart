import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_state.dart';

import '../../../domain/entities/result_entity.dart';
import '../../abstraction/view_model_abs.dart';

final StateNotifierProvider<DetailViewViewModel, DetailViewState> detailProvider =
StateNotifierProvider<DetailViewViewModel, DetailViewState>(
      (StateNotifierProviderRef<DetailViewViewModel, DetailViewState> ref) => DetailViewViewModel(),
);

class DetailViewViewModel extends ViewModelAbs<DetailViewViewModel, DetailViewState> {

  init(ResultEntity resultEntity) {
    state = state.copyWith(resultEntity: resultEntity);

}
  DetailViewViewModel() : super(DetailViewState.initial());

  Future<void> set
}