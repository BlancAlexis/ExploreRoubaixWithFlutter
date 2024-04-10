import '../../data/Result.dart';
import '../entities/result_entity.dart';

abstract class PlacesLocalRepository {
  Future<Result<List<ResultEntity>>> getFavoritePlaces();

  Future<Result<void>> putFavoritePlaces(ResultEntity resultEntity);
}
