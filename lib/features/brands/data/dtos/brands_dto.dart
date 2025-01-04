import 'package:phones/features/brands/domain/entities/brands_entity.dart';
import 'package:phones/utils/format_functions.dart';

class BrandDto {
  int id, amountDevices;
  String name;

  BrandDto({
    required this.id,
    required this.amountDevices,
    required this.name,
  });

  factory BrandDto.fromMap(Map<String, dynamic> map) {
    return BrandDto(
      id: FormatFunctions.safeParseInt(map['id']),
      amountDevices: FormatFunctions.safeParseInt(map['devices']),
      name: FormatFunctions.safeParseString(map['name']),
    );
  }

  Brand toEntity() {
    return Brand(
      id: id,
      amountDevices: amountDevices,
      name: name,
    );
  }
}
