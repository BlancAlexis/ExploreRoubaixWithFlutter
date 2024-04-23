// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_2d_model_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatLngAdapterAdapter extends TypeAdapter<LatLngAdapter> {
  @override
  final int typeId = 1;

  @override
  LatLngAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LatLngAdapter(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LatLngAdapter obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLngAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
