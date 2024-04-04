// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_2d_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoPoint2DModel _$GeoPoint2DModelFromJson(Map<String, dynamic> json) =>
    GeoPoint2DModel(
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoPoint2DModelToJson(GeoPoint2DModel instance) =>
    <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
