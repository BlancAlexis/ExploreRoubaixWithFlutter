// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhotoModelDatabaseAdapter extends TypeAdapter<PhotoModelDatabase> {
  @override
  final int typeId = 1;

  @override
  PhotoModelDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhotoModelDatabase(
      exifOrientation: fields[0] as int?,
      thumbnail: fields[1] as bool?,
      filename: fields[2] as String?,
      format: fields[3] as String?,
      width: fields[4] as int?,
      id: fields[5] as String?,
      height: fields[6] as int?,
      colorSummary: (fields[7] as List?)?.cast<String>(),
      url: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PhotoModelDatabase obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.exifOrientation)
      ..writeByte(1)
      ..write(obj.thumbnail)
      ..writeByte(2)
      ..write(obj.filename)
      ..writeByte(3)
      ..write(obj.format)
      ..writeByte(4)
      ..write(obj.width)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.colorSummary)
      ..writeByte(8)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhotoModelDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
