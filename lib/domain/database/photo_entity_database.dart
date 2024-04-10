import 'package:hive/hive.dart';
import '../../data/network/models/format_enum.dart';
import '../entities/photo_entity.dart';

part 'photo_entity_database.g.dart';

@HiveType(typeId: 2)
class PhotoEntityDatabase extends HiveObject {
  @HiveField(0)
  final int? exifOrientation;
  @HiveField(1)
  final bool? thumbnail;
  @HiveField(2)
  final String? filename;
  @HiveField(3)
  final String? format;
  @HiveField(4)
  final int? width;
  @HiveField(5)
  final String? id;
  @HiveField(6)
  final int? height;
  @HiveField(7)
  final List<String>? colorSummary;
  @HiveField(8)
  final String? url;

   PhotoEntityDatabase(
      {required this.exifOrientation,
        required this.thumbnail,
        required this.filename,
        required FormatEnum format,
        required this.width,
        required this.id,
        required this.height,
        required this.colorSummary,
        required this.url
      }): format = format.name;

  get toEntity => PhotoEntity(
    exifOrientation: exifOrientation,
    thumbnail: thumbnail,
    filename: filename,
    format: format == null ? null : FormatEnum.values.firstWhere((e) => e.name == format),
    width: width,
    id: id,
    height: height,
    colorSummary: colorSummary,
    url: url,
  );



  @override
  String toString() {
    return 'PhotoEntity{exifOrientation: $exifOrientation, thumbnail: $thumbnail, filename: $filename, format: $format, width: $width, id: $id, height: $height, colorSummary: $colorSummary, url: $url}';
  }
}