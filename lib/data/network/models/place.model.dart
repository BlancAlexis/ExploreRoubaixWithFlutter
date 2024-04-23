import 'package:json_annotation/json_annotation.dart';
import 'package:template_flutter_but/data/network/models/result_model.dart';
import 'package:template_flutter_but/domain/entities/place.entity.dart';

part 'place.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PlaceModel {
  final int totalCount;
  final List<ResultModel> results;

  const PlaceModel({required this.totalCount, required this.results});

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);

  PlaceEntity get toEntity => PlaceEntity(
        totalCount: totalCount,
        details: results.map((ResultModel result) => result.toEntity).toList(),
      );

  @override
  String toString() {
    return 'PlaceModel{totalCount: $totalCount, results: $results}';
  }
}
