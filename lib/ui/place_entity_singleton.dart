import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../application/injections/initializer.dart';
import '../domain/entities/place.entity.dart';
import '../domain/repository/places.repository.dart';


@singleton
class PlaceEntitySingleton {
  final PlacesRepository placesRepository;
  late final Stream<PlaceEntity> placesStream;
  late PlaceEntity places;

  PlaceEntitySingleton(this.placesRepository){
    placesStream = fetchPlaces().asStream();
  }

  Future<PlaceEntity> fetchPlaces() async {
    try {
      final places = await placesRepository.getPlaces();
      this.places = places;
      return places;
    } catch (error) {
      print('Error fetching places: $error');
      rethrow;
    }
  }

  Stream<PlaceEntity> get dataStream => placesStream;
}
