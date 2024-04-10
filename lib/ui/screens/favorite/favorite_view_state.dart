import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:template_flutter_but/ui/abstraction/view_state_abs.dart';

import '../../../domain/entities/place.entity.dart';
import '../../../domain/entities/result_entity.dart';

part 'favorite_view_state.g.dart';
@CopyWith()
class FavoriteViewState extends ViewStateAbs {
  List<ResultEntity>? resultsEntity = null;
  bool loading = true;

  FavoriteViewState(this.resultsEntity);

  FavoriteViewState.initial();

  void init(List<ResultEntity> resultEntity) {
    this.resultsEntity = resultEntity;
    this.loading = false;
  }

  @override
  List<Object?> get props => <Object?>[
    resultsEntity,
  ];
}
