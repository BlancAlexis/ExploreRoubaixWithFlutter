import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:template_flutter_but/domain/entities/photo_entity.dart';

import '../../data/local/database_model/geo_point_2d_model_database.dart';
import '../../data/local/database_model/result_model_database.dart';

class ResultEntity {
 bool isFav;
  final int monumHisComId;

  final String appellationCourante;

  final PhotoEntity? photo;

  final String copyrightEtPropriete;

  final String epoque;

  final List<String> siecle;

  final String precisionSurLaProtection;

  final DateTime dateDeProtection;

  final String classement;

  final String statut;

  final String description;

  final String historique;

  final String auteur;

  final String region;

  final String departement;

  final String commune;

  final String niveauDeProtection;

  final int codeDepartement;

  final int insee;

  final String adresseBanSig;

  final LatLng geoPoint2D;

  ResultEntity(
      {required this.monumHisComId,
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
      required this.isFav});

  // Forcément ça marche pas puisque y'a pas de champs isFav

  ResultModelDatabase get toEntityDataBase => ResultModelDatabase(
        monumHisComId: monumHisComId,
        appellationCourante: appellationCourante,
        photo: photo?.toEntityDataBase,
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
        geoPoint2D: LatLngAdapter(
            latitude: geoPoint2D.latitude, longitude: geoPoint2D.longitude),
      );

  @override
  String toString() {
    return 'ResultEntity{monumHisComId: $monumHisComId, appellationCourante: $appellationCourante, photo: $photo, copyrightEtPropriete: $copyrightEtPropriete, epoque: $epoque, siecle: $siecle, precisionSurLaProtection: $precisionSurLaProtection, dateDeProtection: $dateDeProtection, classement: $classement, statut: $statut, description: $description, historique: $historique, auteur: $auteur, region: $region, departement: $departement, commune: $commune, niveauDeProtection: $niveauDeProtection, codeDepartement: $codeDepartement, insee: $insee, adresseBanSig: $adresseBanSig, geoPoint2D: $geoPoint2D}';
  }
}
