import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/Result.dart';

import '../../../../local/database_model/result_model_database.dart';
import '../local.favorite_data_source.dart';

@Singleton(as: LocalFavoriteDataSource)
class LocalFavoriteDataSourceImpl implements LocalFavoriteDataSource {
  static const String nameBox = 'favorite_spot';

  @override
  Future<Result<List<ResultModelDatabase>>> getFavoritePlaces() async {
    try {
      List<ResultModelDatabase> listPlaces = [];
      var box = await Hive.openBox(nameBox);
      for (var key in box.keys) {
        listPlaces.add(box.get(key));
      }
      return Success(data: listPlaces);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  @override
  Future<Result<void>> putFavoritePlaces(
      ResultModelDatabase resultEntity) async {
    try {
      Box box = await Hive.openBox(nameBox);
      await box.put(resultEntity.monumHisComId, resultEntity);
      return Success(data: null);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }

  @override
  Future<Result<void>> removeFavoritePlaces(
      ResultModelDatabase resultEntity) async {
    try {
      Box box = await Hive.openBox(nameBox);
      await box.delete(resultEntity.monumHisComId);
      return Success(data: null);
    } on Exception catch (exception) {
      return Error(exception: exception);
    }
  }
}
