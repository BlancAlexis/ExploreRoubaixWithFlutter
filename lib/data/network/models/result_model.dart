import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:template_flutter_but/data/network/models/photo_model.dart';

import '../../../domain/entities/result_entity.dart';

part 'result_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ResultModel {
  final int? monumHisComId;
  final String? appellationCourante;
  final PhotoModel? photo;
  final String? copyrightEtPropriete;
  final String? epoque;
  final List<String>? siecle;
  final String? precisionSurLaProtection;
  final DateTime? dateDeProtection;
  final String? classement;
  final String? statut;
  final String? description;
  final String? historique;
  final String? auteur;
  final String? region;
  final String? departement;
  final String? commune;
  final String? niveauDeProtection;
  final int? codeDepartement;
  final int? insee;
  final String? adresseBanSig;
  @JsonKey(name :'geo_point_2d',fromJson: _latLngFromJson, toJson: _latLngToJson)
  final LatLng? geoPoint2D;

  const ResultModel({
    required this.monumHisComId,
    required this.appellationCourante,
    required this.photo,
    required this.copyrightEtPropriete,
    required this.epoque,
    required this.siecle,
    required this.precisionSurLaProtection,
    required this.dateDeProtection,
    required this.classement,
    required this.statut,
    required this.description,
    required this.historique,
    required this.auteur,
    required this.region,
    required this.departement,
    required this.commune,
    required this.niveauDeProtection,
    required this.codeDepartement,
    required this.insee,
    required this.adresseBanSig,
    required this.geoPoint2D,
  });

  ResultEntity get toEntity => ResultEntity(
        monumHisComId: monumHisComId,
        appellationCourante: appellationCourante,
        photo: photo?.toEntity,
        copyrightEtPropriete: copyrightEtPropriete,
        epoque: epoque,
        siecle: siecle,
        precisionSurLaProtection: precisionSurLaProtection,
        dateDeProtection: dateDeProtection,
        classement: classement,
        statut: statut,
        description: description,
        historique: historique,
        auteur: auteur,
        region: region,
        departement: departement,
        commune: commune,
        niveauDeProtection: niveauDeProtection,
        codeDepartement: codeDepartement,
        insee: insee,
        adresseBanSig: adresseBanSig,
        geoPoint2D: geoPoint2D ?? const LatLng(0, 0),
      );

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);

  static LatLng _latLngFromJson(Map<String, dynamic>? json) {
    if(json == null){
      return LatLng(0, 0);
    }
    return LatLng(json['lat'] as double, json['lon'] as double);
  }

  static Map<String, dynamic> _latLngToJson(LatLng? object) {
    return {'latitude': object?.latitude ?? 0, 'longitude': object?.longitude??  0};
  }

  @override
  String toString() {
    return 'ResultModel{monumHisComId: $monumHisComId, appellationCourante: $appellationCourante, photo: $photo, copyrightEtPropriete: $copyrightEtPropriete, epoque: $epoque, siecle: $siecle, precisionSurLaProtection: $precisionSurLaProtection, dateDeProtection: $dateDeProtection, classement: $classement, statut: $statut, description: $description, historique: $historique, auteur: $auteur, region: $region, departement: $departement, commune: $commune, niveauDeProtection: $niveauDeProtection, codeDepartement: $codeDepartement, insee: $insee, adresseBanSig: $adresseBanSig, geoPoint2D: $geoPoint2D}';
  }
}
