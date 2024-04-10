// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_2d_entity_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoPoint2DEntityDatabaseAdapter
    extends TypeAdapter<GeoPoint2DEntityDatabase> {
  @override
  final int typeId = 0;

  @override
  GeoPoint2DEntityDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoPoint2DEntityDatabase(
      lon: fields[0] as double,
      lat: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GeoPoint2DEntityDatabase obj) {
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
      other is GeoPoint2DEntityDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
