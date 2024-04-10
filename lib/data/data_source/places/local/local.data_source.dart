import 'package:template_flutter_but/domain/entities/result_entity.dart';

import '../../../../domain/database/result_entity_database.dart';
import '../../../Result.dart';
import '../../../network/models/place.model.dart';

abstract class PlacesLocalDataSource {
  Future<Result<List<ResultEntityDatabase>>> getFavoritePlaces();
  Future<Result<void>> putFavoritePlaces(ResultEntityDatabase resultEntityDatabase);
}
