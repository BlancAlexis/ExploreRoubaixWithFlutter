import 'package:template_flutter_but/domain/entities/result_entity.dart';

import '../../../Result.dart';
import '../../../network/models/place.model.dart';

abstract class PlacesLocalDataSource {
  Future<Result<List<ResultEntity>>> getFavoritePlaces();
  Future<Result<void>> putFavoritePlaces(ResultEntity resultEntity);
}
