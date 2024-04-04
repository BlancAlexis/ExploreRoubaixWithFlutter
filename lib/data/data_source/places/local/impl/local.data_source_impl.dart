import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/Result.dart';
import 'package:template_flutter_but/data/network/models/place.model.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';

import '../local.data_source.dart';


@Singleton(as: PlacesLocalDataSource)
class PlacesLocalDataSourceImpl implements PlacesLocalDataSource {
  @override
  Future<PlaceModel> getFavoritePlaces() async {
    var box = await Hive.openBox('favorite_spot');
    return box.get(idSpot);
  }

  @override
  Future<Result<void>> putFavoritePlaces(ResultEntity resultEntity) {
    try{
      var box = await Hive.openBox('favorite_spot');
      box.put(resultEntity, true);
      return Success(data: );
    }on Exception catch(exception) {
      return Error(exception: exception);
    }

  }

}