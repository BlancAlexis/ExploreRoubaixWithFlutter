import '../../data/local/database_model/photo_model_database.dart';
import '../../data/network/models/format_enum.dart';

class PhotoEntity {
  final int? exifOrientation;
  final bool? thumbnail;
  final String? filename;
  final FormatEnum? format;
  final int? width;
  final String? id;
  final int? height;
  final List<String>? colorSummary;
  final String? url;

  PhotoEntity(
      {required this.exifOrientation,
      required this.thumbnail,
      required this.filename,
      required this.format,
      required this.width,
      required this.id,
      required this.height,
      required this.colorSummary,
      required this.url});

  get toEntityDataBase => PhotoModelDatabase(
      exifOrientation: exifOrientation,
      thumbnail: thumbnail,
      filename: filename ?? "default",
      format: formatEnumToString(format!),
      width: width,
      id: id ?? "-1",
      height: height,
      colorSummary: colorSummary,
      url: url ?? "à changer" // TODO ,,
      );

  @override
  String toString() {
    return 'PhotoEntity{exifOrientation: $exifOrientation, thumbnail: $thumbnail, filename: $filename, format: $format, width: $width, id: $id, height: $height, colorSummary: $colorSummary, url: $url}';
  }
}
