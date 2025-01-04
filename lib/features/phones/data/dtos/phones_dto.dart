import 'package:phones/core/constants.dart';
import 'package:phones/features/phones/domain/entities/phones_entity.dart';
import 'package:phones/utils/format_functions.dart';

class PhoneDto {
  String id, model, description, brand, imageUrl;

  PhoneDto({
    required this.id,
    required this.model,
    required this.description,
    required this.brand,
    required this.imageUrl,
  });

  factory PhoneDto.fromMap(Map<String, dynamic> map) {
    return PhoneDto(
      id: FormatFunctions.safeParseString(map['id']),
      model: FormatFunctions.safeParseString(map['phone_model']),
      description: FormatFunctions.safeParseString(map['description']),
      brand: FormatFunctions.safeParseString(map['brand_name']),
      imageUrl: '${Constants.baseUrlImages}${FormatFunctions.safeParseString(map['id'])}.jpg',
    );
  }

  Phone toEntity() {
    return Phone(
      id: id,
      model: model,
      description: description,
      brand: brand,
      imageUrl: imageUrl,
    );
  }
}
