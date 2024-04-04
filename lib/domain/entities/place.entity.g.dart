// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaceEntityAdapter extends TypeAdapter<PlaceEntity> {
  @override
  final int typeId = 3;

  @override
  PlaceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaceEntity(
      totalCount: fields[0] as int?,
      details: (fields[1] as List?)?.cast<ResultEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlaceEntity obj) {
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
      other is PlaceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
