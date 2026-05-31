Map<String, dynamic> hiveMap(dynamic value) {
  if (value is Map<String, dynamic>) return value;
  if (value is Map) {
    return value.map((key, val) => MapEntry(key.toString(), val));
  }
  throw FormatException('Expected Map, got ${value.runtimeType}');
}

List<Map<String, dynamic>>? hiveMapList(dynamic value) {
  if (value == null) return null;
  if (value is! List) return null;
  return value.map((e) => hiveMap(e)).toList();
}
