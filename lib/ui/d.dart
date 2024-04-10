import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/injections/initializer.dart';
import '../domain/entities/place.entity.dart';
import '../domain/repository/places.repository.dart';

final mySingletonProvider = Provider<MySingleton>(
      (ref) => MySingleton(
  ),
  name: 'MySingleton', // Ensure a unique name for the singleton
);

class MySingleton {
  final PlacesRepository placesRepository;
  late final Stream<PlaceEntity> _dataStream;

  MySingleton(): placesRepository = injector<PlacesRepository>() {
    _dataStream = _fetchData().asStream();
  }

  Future<PlaceEntity> _fetchData() async {
    try {
      final places = await placesRepository.getPlaces();
      return places;
    } catch (error) {
      print('Error fetching places: $error');
      throw error;
    }
  }

  Stream<PlaceEntity> get dataStream => _dataStream;
}