import 'package:json_annotation/json_annotation.dart';
import 'package:template_flutter_but/data/network/models/photo_model.dart';

import '../../../domain/entities/result_entity.dart';
import 'geo_point_2d_model.dart';

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
  final GeoPoint2DModel? geoPoint2D;
  final String? lat;
  final String? long;

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
    required this.lat,
    required this.long,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);

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
    geoPoint2D: geoPoint2D?.toEntity,
    lat: lat,
    long: long,
  );

  @override
  String toString() {
    return 'ResultModel{monumHisComId: $monumHisComId, appellationCourante: $appellationCourante, photo: $photo, copyrightEtPropriete: $copyrightEtPropriete, epoque: $epoque, siecle: $siecle, precisionSurLaProtection: $precisionSurLaProtection, dateDeProtection: $dateDeProtection, classement: $classement, statut: $statut, description: $description, historique: $historique, auteur: $auteur, region: $region, departement: $departement, commune: $commune, niveauDeProtection: $niveauDeProtection, codeDepartement: $codeDepartement, insee: $insee, adresseBanSig: $adresseBanSig, geoPoint2D: $geoPoint2D, lat: $lat, long: $long}';
  }
}