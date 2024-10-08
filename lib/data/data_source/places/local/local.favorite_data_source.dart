import '../../../Result.dart';
import '../../../local/database_model/result_model_database.dart';

abstract class LocalFavoriteDataSource {
  Future<Result<List<ResultModelDatabase>>> getFavoritePlaces();

  Future<Result<void>> putFavoritePlaces(
      ResultModelDatabase resultEntityDatabase);

  Future<Result<void>> removeFavoritePlaces(
      ResultModelDatabase resultEntityDatabase);

  Future<Result<bool>> isFavorite(int monumentId);
}
