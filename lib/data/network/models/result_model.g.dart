// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      monumHisComId: json['monum_his_com_id'] as int,
      appellationCourante: json['appellation_courante'] as String,
      photo: json['photo'] == null
          ? null
          : PhotoModel.fromJson(json['photo'] as Map<String, dynamic>),
      copyrightEtPropriete: json['copyright_et_propriete'] as String?,
      epoque: json['epoque'] as String,
      siecle:
          (json['siecle'] as List<dynamic>).map((e) => e as String).toList(),
      precisionSurLaProtection: json['precision_sur_la_protection'] as String?,
      dateDeProtection: DateTime.parse(json['date_de_protection'] as String),
      classement: json['classement'] as String,
      statut: json['statut'] as String,
      description: json['description'] as String?,
      historique: json['historique'] as String?,
      auteur: json['auteur'] as String?,
      region: json['region'] as String?,
      departement: json['departement'] as String?,
      commune: json['commune'] as String?,
      niveauDeProtection: json['niveau_de_protection'] as String?,
      codeDepartement: json['code_departement'] as int?,
      insee: json['insee'] as int?,
      adresseBanSig: json['adresse_ban_sig'] as String,
      geoPoint2D: ResultModel._latLngFromJson(
          json['geo_point_2d'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'monum_his_com_id': instance.monumHisComId,
      'appellation_courante': instance.appellationCourante,
      'photo': instance.photo?.toJson(),
      'copyright_et_propriete': instance.copyrightEtPropriete,
      'epoque': instance.epoque,
      'siecle': instance.siecle,
      'precision_sur_la_protection': instance.precisionSurLaProtection,
      'date_de_protection': instance.dateDeProtection.toIso8601String(),
      'classement': instance.classement,
      'statut': instance.statut,
      'description': instance.description,
      'historique': instance.historique,
      'auteur': instance.auteur,
      'region': instance.region,
      'departement': instance.departement,
      'commune': instance.commune,
      'niveau_de_protection': instance.niveauDeProtection,
      'code_departement': instance.codeDepartement,
      'insee': instance.insee,
      'adresse_ban_sig': instance.adresseBanSig,
      'geo_point_2d': ResultModel._latLngToJson(instance.geoPoint2D),
    };
