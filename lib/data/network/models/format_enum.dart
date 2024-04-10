import 'package:json_annotation/json_annotation.dart';

enum FormatEnum {
  @JsonValue('JPEG')
  jpeg,
  none;
}

String formatEnumToString(FormatEnum format) {
  switch (format) {
    case FormatEnum.jpeg:
      return 'jpeg';
    case FormatEnum.none:
      return 'none';
  }
}
