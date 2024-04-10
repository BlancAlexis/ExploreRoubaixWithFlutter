import 'package:template_flutter_but/domain/entities/result_entity.dart';
import 'package:hive/hive.dart';

part 'place.entity_database.g.dart';

@HiveType(typeId: 3)
class PlaceEntityDatabase extends HiveObject {
  @HiveField(0)
  final int? totalCount;
  @HiveField(1)
  final List<ResultEntity>? details;

   PlaceEntityDatabase({required this.totalCount, required this.details});

  @override
  String toString() {
    return 'PlaceEntity{totalCount: $totalCount, results: $details}';
  }
}