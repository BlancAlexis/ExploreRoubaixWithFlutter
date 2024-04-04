import 'package:hive/hive.dart';
part 'geo_point_2d_entity.g.dart';

@HiveType(typeId: 0)
class GeoPoint2DEntity extends HiveObject {
  @HiveField(0)
  final double lon;
  @HiveField(1)
  final double lat;

  GeoPoint2DEntity(
      {required this.lon,
        required this.lat,
      });

  @override
  String toString() {
    return 'GeoPoint2DEntity{lon: $lon, lat: $lat}';
  }
}