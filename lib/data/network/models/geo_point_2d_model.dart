import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/geo_point_2d_entity.dart';

part 'geo_point_2d_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GeoPoint2DModel {
  final double lon;
  final double lat;

  const GeoPoint2DModel({
    required this.lon,
    required this.lat,
  });

  factory GeoPoint2DModel.fromJson(Map<String, dynamic> json) =>
      _$GeoPoint2DModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoPoint2DModelToJson(this);

  GeoPoint2DEntity get toEntity => GeoPoint2DEntity(lon: lon, lat: lat);

  @override
  String toString() {
    return 'GeoPoint2DModel{lon: $lon, lat: $lat}';
  }
}
