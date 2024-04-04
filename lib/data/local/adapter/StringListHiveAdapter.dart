import 'package:hive/hive.dart';

class StringListHiveAdapter extends TypeAdapter<List<String>> {
  @override
  final typeId = 100;

  @override
  List<String> read(BinaryReader reader) {
    final count = reader.readByte();
    final list = <String>[];
    for (var i = 0; i < count; i++) {
      list.add(reader.readString());
    }
    return list;
  }

  @override
  void write(BinaryWriter writer, List<String> obj) {
    writer.writeByte(obj.length);
    for (final obj in obj) {
      writer.writeString(obj);
    }
  }
}
