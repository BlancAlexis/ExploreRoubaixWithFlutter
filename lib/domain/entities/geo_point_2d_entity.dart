import 'package:hive/hive.dart';

import '../database/geo_point_2d_entity_database.dart';

class GeoPoint2DEntity  {
  final double lon;
  final double lat;

  GeoPoint2DEntity(
      {required this.lon,
        required this.lat,
      });

  get toEntityDataBase => GeoPoint2DEntityDatabase(
    lon: lon,
    lat: lat,
  );

  @override
  String toString() {
    return 'GeoPoint2DEntity{lon: $lon, lat: $lat}';
  }
}