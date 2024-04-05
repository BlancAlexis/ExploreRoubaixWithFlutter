import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/Result.dart';
import 'package:template_flutter_but/data/network/models/place.model.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';

import '../local.data_source.dart';


@Singleton(as: PlacesLocalDataSource)
class PlacesLocalDataSourceImpl implements PlacesLocalDataSource {
  static const nameBox = 'favorite_spot';
  @override
  Future<Result<List<ResultEntity>>> getFavoritePlaces() async {
    try {
      List<ResultEntity> listPlaces = [];
      var box = await Hive.openBox(nameBox);
      for (var key in box.keys) {
        listPlaces.add(box.get(key));
      }
      return Success(data: listPlaces);
    } on Exception catch(exception) {
      return Error(exception: exception);
    }
  }

  @override
  Future<Result<void>> putFavoritePlaces(ResultEntity resultEntity) async {
    try{
      Box box = await Hive.openBox(nameBox);
      box.put(resultEntity.monumHisComId, resultEntity);
      return Success(data: null );
    }on Exception catch(exception) {
      return Error(exception: exception);
    }
  }

}