class GeoPoint2DEntity {

  final double lon;
  final double lat;

  const GeoPoint2DEntity(
      {required this.lon,
        required this.lat,
      });

  @override
  String toString() {
    return 'GeoPoint2DEntity{lon: $lon, lat: $lat}';
  }
}