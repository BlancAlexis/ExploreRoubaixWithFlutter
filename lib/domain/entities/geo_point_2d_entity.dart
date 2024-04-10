
import '../../data/local/database_model/geo_point_2d_model_database.dart';

class GeoPoint2DEntity {
  final double lon;
  final double lat;

  GeoPoint2DEntity({
    required this.lon,
    required this.lat,
  });

  get toEntityDataBase => GeoPoint2DModelDatabase(
        lon: lon,
        lat: lat,
      );

  @override
  String toString() {
    return 'GeoPoint2DEntity{lon: $lon, lat: $lat}';
  }
}
