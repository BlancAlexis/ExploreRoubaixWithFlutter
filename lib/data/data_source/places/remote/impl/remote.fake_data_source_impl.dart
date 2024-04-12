import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:template_flutter_but/data/data_source/places/remote/remote.data_source.dart';

import '../../../../network/endpoints/place.endpoint.dart';
import '../../../../network/models/place.model.dart';

// TODO @Singleton(as: PlacesRemoteDataSource)
class FakePlacesRemoteDataSourceImpl implements PlacesRemoteDataSource {

  FakePlacesRemoteDataSourceImpl();

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  @override
  Future<PlaceModel> getPlaces() async {
    Map<String, dynamic> fakeData = await loadJsonFromAssets('assets/json/data.json');
    return PlaceModel.fromJson(fakeData);
  }
}