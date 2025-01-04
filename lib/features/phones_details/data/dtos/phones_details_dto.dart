import 'package:phones/features/phones_details/domain/entities/phones_details_entity.dart';
import 'package:phones/utils/format_functions.dart';

class PhoneDetailsDto {
  String name, storage, memory, chipset, batterySize, imageUrl;
  DateTime releaseDate;

  PhoneDetailsDto({
    required this.name,
    required this.storage,
    required this.memory,
    required this.chipset,
    required this.batterySize,
    required this.imageUrl,
    required this.releaseDate,
  });

  factory PhoneDetailsDto.fromMap(Map<String, dynamic> map) {
    return PhoneDetailsDto(
      name: FormatFunctions.safeParseString(map['name']),
      storage: FormatFunctions.safeParseString(map['storage']),
      memory: FormatFunctions.safeParseString(map['memory']),
      chipset: FormatFunctions.safeParseString(map['chipset']),
      batterySize: FormatFunctions.safeParseString(map['batterySize']),
      imageUrl: FormatFunctions.safeParseString(map['imageUrl']),
      releaseDate: DateTime.now(),
    );
  }

  PhoneDetails toEntity() {
    return PhoneDetails(
      name: name,
      storage: storage,
      memory: memory,
      chipset: chipset,
      batterySize: batterySize,
      imageUrl: imageUrl,
      releaseDate: releaseDate,
    );
  }
}
