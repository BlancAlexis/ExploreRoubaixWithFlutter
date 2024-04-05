
import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/Result.dart';
import 'package:template_flutter_but/data/network/models/place.model.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';

import '../../../domain/repository/local.repository.dart';
import '../../data_source/places/local/local.data_source.dart';

@Singleton(as: PlacesLocalRepository)
class LocalRepositoryImpl implements PlacesLocalRepository {
  final PlacesLocalDataSource localDataSource;

  LocalRepositoryImpl({required PlacesLocalDataSource localDataSource})
      : localDataSource = localDataSource;

  @override
  Future<Result<List<ResultEntity>>> getFavoritePlaces() {
    return localDataSource.getFavoritePlaces();
  }

  @override
  Future<Result<void>> putFavoritePlaces(ResultEntity resultEntity) {
    return localDataSource.putFavoritePlaces(resultEntity);
  }


}
