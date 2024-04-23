import 'package:json_annotation/json_annotation.dart';
import 'package:template_flutter_but/data/network/models/format_enum.dart';
import 'package:template_flutter_but/domain/entities/photo_entity.dart';

part 'photo_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PhotoModel {
  final int? exifOrientation;
  final bool? thumbnail;
  final String filename;
  @JsonKey(unknownEnumValue: FormatEnum.none)
  final FormatEnum? format;
  final int? width;
  final String id;
  final int? height;
  final List<String>? colorSummary;
  final String url;

  const PhotoModel(
      {required this.exifOrientation,
      required this.thumbnail,
      required this.filename,
      required this.format,
      required this.width,
      required this.id,
      required this.height,
      required this.colorSummary,
      required this.url});

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);

  PhotoEntity get toEntity => PhotoEntity(
      exifOrientation: exifOrientation,
      thumbnail: thumbnail,
      filename: filename ,
      format: format,
      width: width,
      id: id,
      height: height,
      colorSummary: colorSummary,
      url: url);

  @override
  String toString() {
    return 'PhotoModel{exifOrientation: $exifOrientation, thumbnail: $thumbnail, filename: $filename, format: $format, width: $width, id: $id, height: $height, colorSummary: $colorSummary, url: $url}';
  }
}
