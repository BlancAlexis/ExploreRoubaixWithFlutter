import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';

import '../domain/entities/place.entity.dart';
import '../domain/repository/places.repository.dart';

@singleton
class PlaceEntitySingleton {
  final PlacesRepository placesRepository;
  late final StreamController<PlaceEntity> placesStream = StreamController<PlaceEntity>();
  late PlaceEntity places;


  PlaceEntitySingleton(this.placesRepository) {
    fetchPlaces(0);
  }

  void g (int offset){
    fetchPlacesPaginate(offset);
  }
  Future<void> fetchPlaces(int offset) async {
    print('fetch');
    try {
      final places = await placesRepository.getPlaces(offset);
      this.places = places;
      placesStream.add(places);
    } catch (error) {
      print('Error fetching places: $error');
      rethrow;
    }
  }

  Future<void> fetchPlacesPaginate(int offset) async {
    print('fetch paginate');
    try {
      final places = await placesRepository.getPlaces(offset);
      this.places.details.addAll(places.details);
      placesStream.add(places);
    } catch (error) {
      print('Error fetching places: $error');
      rethrow;
    }
  }

}
