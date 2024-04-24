import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:template_flutter_but/ui/abstraction/view_state_abs.dart';

import '../../../domain/entities/result_entity.dart';

part 'detail_view_state.g.dart';

@CopyWith()
class DetailViewState extends ViewStateAbs {
  ResultEntity? resultEntity;

  DetailViewState(this.resultEntity);

  DetailViewState.initial();

  void init(ResultEntity resultEntity) {
    this.resultEntity = resultEntity;
  }

  @override
  List<Object?> get props => <Object?>[
        resultEntity,
      ];

// TODO  Comment géré state
}
