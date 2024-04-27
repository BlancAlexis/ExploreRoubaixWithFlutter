import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/data_source/places/remote/remote.data_source.dart';
import 'package:template_flutter_but/data/network/endpoints/place.endpoint.dart';
import 'package:template_flutter_but/data/network/models/place.model.dart';

@Singleton(as: PlacesRemoteDataSource)
class PlacesRemoteDataSourceImpl implements PlacesRemoteDataSource {
  final PlacesEndpoint _placesEndpoint;
  final LIMIT = 10;

  PlacesRemoteDataSourceImpl({required PlacesEndpoint placesEndpoint})
      : _placesEndpoint = placesEndpoint;

  @override
  Future<PlaceModel> getPlaces(int offest) {
    return _placesEndpoint.getPlaces(offset : offest,limit: LIMIT);
  }
}
