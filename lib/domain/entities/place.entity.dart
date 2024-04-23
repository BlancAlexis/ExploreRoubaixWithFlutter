import 'package:template_flutter_but/domain/entities/result_entity.dart';

class PlaceEntity {
  final int totalCount;
  final List<ResultEntity> details;

  PlaceEntity({required this.totalCount, required this.details});

  @override
  String toString() {
    return 'PlaceEntity{totalCount: $totalCount, results: $details}';
  }
}
