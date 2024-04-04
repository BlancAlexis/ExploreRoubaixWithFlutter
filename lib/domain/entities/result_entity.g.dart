// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultEntityAdapter extends TypeAdapter<ResultEntity> {
  @override
  final int typeId = 4;

  @override
  ResultEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultEntity(
      monumHisComId: fields[0] as int?,
      appellationCourante: fields[1] as String?,
      photo: fields[2] as PhotoEntity?,
      copyrightEtPropriete: fields[3] as String?,
      epoque: fields[4] as String?,
      siecle: (fields[5] as List?)?.cast<String>(),
      precisionSurLaProtection: fields[6] as String?,
      dateDeProtection: fields[7] as DateTime?,
      classement: fields[8] as String?,
      statut: fields[9] as String?,
      description: fields[10] as String?,
      historique: fields[11] as String?,
      auteur: fields[12] as String?,
      region: fields[13] as String?,
      departement: fields[14] as String?,
      commune: fields[15] as String?,
      niveauDeProtection: fields[16] as String?,
      codeDepartement: fields[17] as int?,
      insee: fields[18] as int?,
      adresseBanSig: fields[19] as String?,
      geoPoint2D: fields[20] as GeoPoint2DEntity?,
      lat: fields[21] as String?,
      long: fields[22] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ResultEntity obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.monumHisComId)
      ..writeByte(1)
      ..write(obj.appellationCourante)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.copyrightEtPropriete)
      ..writeByte(4)
      ..write(obj.epoque)
      ..writeByte(5)
      ..write(obj.siecle)
      ..writeByte(6)
      ..write(obj.precisionSurLaProtection)
      ..writeByte(7)
      ..write(obj.dateDeProtection)
      ..writeByte(8)
      ..write(obj.classement)
      ..writeByte(9)
      ..write(obj.statut)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.historique)
      ..writeByte(12)
      ..write(obj.auteur)
      ..writeByte(13)
      ..write(obj.region)
      ..writeByte(14)
      ..write(obj.departement)
      ..writeByte(15)
      ..write(obj.commune)
      ..writeByte(16)
      ..write(obj.niveauDeProtection)
      ..writeByte(17)
      ..write(obj.codeDepartement)
      ..writeByte(18)
      ..write(obj.insee)
      ..writeByte(19)
      ..write(obj.adresseBanSig)
      ..writeByte(20)
      ..write(obj.geoPoint2D)
      ..writeByte(21)
      ..write(obj.lat)
      ..writeByte(22)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
