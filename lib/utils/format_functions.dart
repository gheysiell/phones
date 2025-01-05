class FormatFunctions {
  static String safeParseString(dynamic value) {
    return (value?.toString() ?? '');
  }

  static int safeParseInt(dynamic value) {
    return int.tryParse(value?.toString() ?? '') ?? 0;
  }

  static Map<String, dynamic> safeParseMap(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    } else if (value is Map) {
      return value.map((key, val) => MapEntry(key.toString(), val));
    }
    return {};
  }

  static List<dynamic> safeParseList(dynamic value) {
    if (value is List) {
      return value;
    }
    return [];
  }
}
