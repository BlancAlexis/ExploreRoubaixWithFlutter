import 'package:hive/hive.dart';

part 'geo_point_2d_model_database.g.dart';


@HiveType(typeId: 1)
class LatLngAdapter extends HiveObject {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  LatLngAdapter({required this.latitude, required this.longitude});
}