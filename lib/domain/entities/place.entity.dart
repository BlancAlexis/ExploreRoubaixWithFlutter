import 'package:template_flutter_but/domain/entities/result_entity.dart';
import 'package:hive/hive.dart';
part 'place.entity.g.dart';

@HiveType(typeId: 3)
class PlaceEntity extends HiveObject {
  @HiveField(0)
  final int? totalCount;
  @HiveField(1)
  final List<ResultEntity>? details;

   PlaceEntity({required this.totalCount, required this.details});

  @override
  String toString() {
    return 'PlaceEntity{totalCount: $totalCount, results: $details}';
  }
}