import 'package:phones/core/enums.dart';
import 'package:phones/features/phones/data/dtos/phones_dto.dart';
import 'package:phones/features/phones/domain/entities/phone_response_entity.dart';

class PhoneResponseDto {
  List<PhoneDto> phonesDto = [];
  ResponseStatus responseStatus;

  PhoneResponseDto({
    required this.phonesDto,
    required this.responseStatus,
  });

  PhoneResponse toEntity() {
    return PhoneResponse(
      phones: phonesDto.map((phoneDto) => phoneDto.toEntity()).toList(),
      responseStatus: responseStatus,
    );
  }
}
