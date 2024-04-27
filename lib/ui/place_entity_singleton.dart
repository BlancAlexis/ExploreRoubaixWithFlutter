import 'package:injectable/injectable.dart';

import '../domain/entities/place.entity.dart';
import '../domain/repository/places.repository.dart';

@singleton
class PlaceEntitySingleton {
  final PlacesRepository placesRepository;
  late final Stream<PlaceEntity> placesStream;
  late PlaceEntity places;


  PlaceEntitySingleton(this.placesRepository) {
    placesStream = fetchPlaces(0).asStream();
  }

  void g (int offset){
    placesStream = fetchPlacesPaginate(offset).asStream();
  }
  Future<PlaceEntity> fetchPlaces(int offset) async {
    print('fetch');
    try {
      final places = await placesRepository.getPlaces(offset);
      this.places = places;
      return places;
    } catch (error) {
      print('Error fetching places: $error');
      rethrow;
    }
  }

  Future<PlaceEntity> fetchPlacesPaginate(int offset) async {
    print('fetch paginate');
    try {
      final places = await placesRepository.getPlaces(offset);
      this.places.details.addAll(places.details);
      return places;
    } catch (error) {
      print('Error fetching places: $error');
      rethrow;
    }
  }

  Stream<PlaceEntity> get dataStream => placesStream;
}
