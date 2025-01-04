import 'package:phones/core/enums.dart';
import 'package:phones/features/phones_details/data/dtos/phones_details_dto.dart';
import 'package:phones/features/phones_details/domain/entities/phones_details_response_entity.dart';

class PhoneDetailsResponseDto {
  PhoneDetailsDto? phoneDetailsDto;
  ResponseStatus responseStatus;

  PhoneDetailsResponseDto({
    required this.phoneDetailsDto,
    required this.responseStatus,
  });

  PhoneDetailsResponse toEntity() {
    return PhoneDetailsResponse(
      phoneDetails: phoneDetailsDto?.toEntity(),
      responseStatus: responseStatus,
    );
  }
}
