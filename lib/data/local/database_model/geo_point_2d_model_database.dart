import 'package:hive/hive.dart';

import '../../../domain/entities/geo_point_2d_entity.dart';

part 'geo_point_2d_model_database.g.dart';

@HiveType(typeId: 0)
class GeoPoint2DModelDatabase extends HiveObject {
  @HiveField(0)
  final double lon;
  @HiveField(1)
  final double lat;

  GeoPoint2DModelDatabase({
    required this.lon,
    required this.lat,
  });

  get toEntity => GeoPoint2DEntity(
        lon: lon,
        lat: lat,
      );

  @override
  String toString() {
    return 'GeoPoint2DEntity{lon: $lon, lat: $lat}';
  }
}
