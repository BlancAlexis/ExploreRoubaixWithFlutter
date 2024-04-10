import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/Result.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';

import '../../../domain/repository/local.repository.dart';
import '../../data_source/places/local/local.favorite_data_source.dart';

@Singleton(as: PlacesLocalRepository)
class LocalRepositoryImpl implements PlacesLocalRepository {
  final LocalFavoriteDataSource localDataSource;

  LocalRepositoryImpl({required LocalFavoriteDataSource localDataSource})
      : localDataSource = localDataSource;

  @override
  Future<Result<List<ResultEntity>>> getFavoritePlaces() {
    return localDataSource.getFavoritePlaces().then((value) {
      if (value is Success) {
        return Success(
            data: List<ResultEntity>.from(
                (value as Success).data.map((e) => e.toEntity).toList()));
      } else {
        return Error(exception: (value as Error).exception);
      }
    });
  }

  @override
  Future<Result<void>> putFavoritePlaces(ResultEntity resultEntity) {
    return localDataSource.putFavoritePlaces(resultEntity.toEntityDataBase);
  }
}
