import 'package:flutter/cupertino.dart';
import 'package:template_flutter_but/domain/entities/place.entity.dart';

import 'package:riverpod/riverpod.dart';
import '../application/injections/initializer.dart';
import '../domain/repository/places.repository.dart';

final mySingletonProvider = Provider<MySingleton>(
      (ref) => MySingleton(),
  name: 'MySingleton', // Nom unique pour le singleton
);

class MySingleton {
  late final PlacesRepository placesRepository = injector<PlacesRepository>() ;
  late PlaceEntity _data;

  MySingleton() {
    _fetchData();
  }

  Future<void> _fetchData() async {
    _data = await placesRepository.getPlaces();;
  }

  PlaceEntity get data => _data;
}
