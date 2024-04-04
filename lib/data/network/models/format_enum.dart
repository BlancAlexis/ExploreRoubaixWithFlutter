import 'package:json_annotation/json_annotation.dart';

enum FormatEnum {
  @JsonValue('JPEG')
  jpeg,
  none;
}