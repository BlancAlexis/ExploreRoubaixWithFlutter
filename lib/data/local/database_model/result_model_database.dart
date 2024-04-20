import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_flutter_but/data/local/database_model/photo_model_database.dart';

import '../../../domain/entities/result_entity.dart';
import 'geo_point_2d_model_database.dart';

part 'result_model_database.g.dart';

@HiveType(typeId: 4)
class ResultModelDatabase extends HiveObject {
  @HiveField(0)
  final int? monumHisComId;

  @HiveField(1)
  final String? appellationCourante;

  @HiveField(2)
  final PhotoModelDatabase? photo;

  @HiveField(3)
  final String? copyrightEtPropriete;

  @HiveField(4)
  final String? epoque;

  @HiveField(5)
  final List<String>? siecle;

  @HiveField(6)
  final String? precisionSurLaProtection;

  @HiveField(7)
  final DateTime? dateDeProtection;

  @HiveField(8)
  final String? classement;

  @HiveField(9)
  final String? statut;

  @HiveField(10)
  final String? description;

  @HiveField(11)
  final String? historique;

  @HiveField(12)
  final String? auteur;

  @HiveField(13)
  final String? region;

  @HiveField(14)
  final String? departement;

  @HiveField(15)
  final String? commune;

  @HiveField(16)
  final String? niveauDeProtection;

  @HiveField(17)
  final int? codeDepartement;

  @HiveField(18)
  final int? insee;

  @HiveField(19)
  final String? adresseBanSig;

  @HiveField(20)
  final GeoPoint2DModelDatabase? geoPoint2D;

  @HiveField(21)
  final String? lat;

  @HiveField(22)
  final String? long;

  @HiveField(23)
  bool isFav;

  ResultModelDatabase({required this.monumHisComId,
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
    this.isFav = false
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
        geoPoint2D: geoPoint2D?.toEntity,
        lat: lat,
        long: long,
      isFav : true
      );

  @override
  String toString() {
    return 'ResultEntity{monumHisComId: $monumHisComId, appellationCourante: $appellationCourante, photo: $photo, copyrightEtPropriete: $copyrightEtPropriete, epoque: $epoque, siecle: $siecle, precisionSurLaProtection: $precisionSurLaProtection, dateDeProtection: $dateDeProtection, classement: $classement, statut: $statut, description: $description, historique: $historique, auteur: $auteur, region: $region, departement: $departement, commune: $commune, niveauDeProtection: $niveauDeProtection, codeDepartement: $codeDepartement, insee: $insee, adresseBanSig: $adresseBanSig, geoPoint2D: $geoPoint2D, lat: $lat, long: $long}';
  }
}
