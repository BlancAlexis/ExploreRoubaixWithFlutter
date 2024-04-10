import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';

import '../application/injections/initializer.dart';
import '../domain/entities/place.entity.dart';
import '../domain/repository/places.repository.dart';

@singleton
final PlaceEntityProvider = Provider<PlaceEntitySingleton>(
  (ref) => PlaceEntitySingleton(),
  name: 'MySingleton',
);

class PlaceEntitySingleton {
  final PlacesRepository placesRepository;
  late final Stream<PlaceEntity> placesStream;

  PlaceEntitySingleton() : placesRepository = injector<PlacesRepository>() {
    placesStream = fetchPlaces().asStream();
  }

  Future<PlaceEntity> fetchPlaces() async {
    try {
      final places = await placesRepository.getPlaces();
      return places;
    } catch (error) {
      print('Error fetching places: $error');
      throw error;
    }
  }

  Stream<PlaceEntity> get dataStream => placesStream;
}
