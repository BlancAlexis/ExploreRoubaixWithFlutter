import 'package:hive/hive.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';

part 'place.model_database.g.dart';


@HiveType(typeId: 3)
class PlaceModelDatabase extends HiveObject {
  @HiveField(0)
  final int? totalCount;
  @HiveField(1)
  final List<ResultEntity>? details;

  PlaceModelDatabase({required this.totalCount, required this.details});

  @override
  String toString() {
    return 'PlaceEntity{totalCount: $totalCount, results: $details}';
  }
}
