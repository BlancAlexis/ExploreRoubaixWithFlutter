import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:template_flutter_but/ui/abstraction/view_state_abs.dart';

import '../../../domain/entities/place.entity.dart';

part 'home.state.g.dart';

@CopyWith()
class HomeState extends ViewStateAbs {
  final bool loading;
  final PlaceEntity? listPlace;

  const HomeState({required this.loading, required this.listPlace});

  const HomeState.initial() : loading = false, listPlace = null;


  @override
  List<Object?> get props => <Object?>[
        loading,
    listPlace,
      ];
}
