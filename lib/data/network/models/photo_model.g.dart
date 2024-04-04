// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) => PhotoModel(
      exifOrientation: json['exif_orientation'] as int?,
      thumbnail: json['thumbnail'] as bool?,
      filename: json['filename'] as String?,
      format: $enumDecodeNullable(_$FormatEnumEnumMap, json['format'],
          unknownValue: FormatEnum.none),
      width: json['width'] as int?,
      id: json['id'] as String?,
      height: json['height'] as int?,
      colorSummary: (json['color_summary'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$PhotoModelToJson(PhotoModel instance) =>
    <String, dynamic>{
      'exif_orientation': instance.exifOrientation,
      'thumbnail': instance.thumbnail,
      'filename': instance.filename,
      'format': _$FormatEnumEnumMap[instance.format],
      'width': instance.width,
      'id': instance.id,
      'height': instance.height,
      'color_summary': instance.colorSummary,
      'url': instance.url,
    };

const _$FormatEnumEnumMap = {
  FormatEnum.jpeg: 'JPEG',
  FormatEnum.none: 'none',
};
