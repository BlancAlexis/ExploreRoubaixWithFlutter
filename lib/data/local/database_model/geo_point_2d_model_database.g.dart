// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_2d_model_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoPoint2DModelDatabaseAdapter
    extends TypeAdapter<GeoPoint2DModelDatabase> {
  @override
  final int typeId = 0;

  @override
  GeoPoint2DModelDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoPoint2DModelDatabase(
      lon: fields[0] as double,
      lat: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GeoPoint2DModelDatabase obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lon)
      ..writeByte(1)
      ..write(obj.lat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoPoint2DModelDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
