// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.model_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceModelDatabaseAdapter extends TypeAdapter<PlaceModelDatabase> {
  @override
  final int typeId = 2;

  @override
  PlaceModelDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceModelDatabase(
      totalCount: fields[0] as int,
      details: (fields[1] as List).cast<ResultEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlaceModelDatabase obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.totalCount)
      ..writeByte(1)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaceModelDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
