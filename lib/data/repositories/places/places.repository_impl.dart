import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/data_source/places/local/local.favorite_data_source.dart';
import 'package:template_flutter_but/data/data_source/places/remote/remote.data_source.dart';
import 'package:template_flutter_but/data/network/models/place.model.dart';
import 'package:template_flutter_but/domain/entities/place.entity.dart';
import 'package:template_flutter_but/domain/repository/places.repository.dart';

import '../../Result.dart';

@Singleton(as: PlacesRepository)
class PlacesRepositoryImpl implements PlacesRepository {
  final PlacesRemoteDataSource _placesRemoteDataSource;
  final LocalFavoriteDataSource _favoriteDataSource;

  PlacesRepositoryImpl(
      {required PlacesRemoteDataSource placesRemoteDataSource,
      required LocalFavoriteDataSource localFavoriteDataSource})
      : _placesRemoteDataSource = placesRemoteDataSource,
        _favoriteDataSource = localFavoriteDataSource;

  @override
  Future<PlaceEntity> getPlaces() async {
    final PlaceModel model = await _placesRemoteDataSource.getPlaces();
    PlaceEntity entity = model.toEntity;
    entity.details.forEach((detail) async {
      final Result<bool> isFav =
          await _favoriteDataSource.isFavorite(detail.monumHisComId);
      detail.isFav = decode(isFav); // Update isFav directly
    });
    return entity;
  }

  bool decode(Result<bool> resultEntity) {
    if (resultEntity is Success) {
      print('Success');
      return (resultEntity as Success<bool>).data;
    } else {
      throw Exception('frero jsais pas');
    }
  }
}
