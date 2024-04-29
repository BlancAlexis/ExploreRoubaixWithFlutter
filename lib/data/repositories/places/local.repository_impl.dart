import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/Result.dart';
import 'package:template_flutter_but/data/local/database_model/result_model_database.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';

import '../../../domain/repository/local.repository.dart';
import '../../data_source/places/local/local.favorite_data_source.dart';

@Singleton(as: PlacesLocalRepository)
class LocalRepositoryImpl implements PlacesLocalRepository {
  final LocalFavoriteDataSource localDataSource;

  LocalRepositoryImpl({required this.localDataSource});

  @override
  Future<Result<List<ResultEntity>>> getFavoritePlaces() {
    return localDataSource.getFavoritePlaces().then((value) {
      if (value is Success) {
        return Success(
            data: List<ResultEntity>.from(
                (value as Success).data.map((e) => e.databaseToEntity).toList()));
      } else {
        return Error(exception: (value as Error).exception);
      }
    });
  }

  @override
  Future<Result<void>> putFavoritePlaces(ResultEntity resultEntity) {
    ResultModelDatabase resultEntityDataBase = resultEntity.toEntityDataBase;
    resultEntityDataBase.isFav = true;
    return localDataSource.putFavoritePlaces(resultEntityDataBase);
  }

  @override
  Future<Result<void>> removeFavoritePlaces(ResultEntity resultEntity) {
    return localDataSource.removeFavoritePlaces(resultEntity.toEntityDataBase);
  }
}
