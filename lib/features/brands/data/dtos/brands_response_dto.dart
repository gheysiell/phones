import 'package:phones/core/enums.dart';
import 'package:phones/features/brands/data/dtos/brands_dto.dart';
import 'package:phones/features/brands/domain/entities/brands_response_entity.dart';

class BrandResponseDto {
  List<BrandDto> brandsDto;
  ResponseStatus responseStatus;

  BrandResponseDto({
    required this.brandsDto,
    required this.responseStatus,
  });

  BrandResponse toEntity() {
    return BrandResponse(
      brands: brandsDto.map((brand) => brand.toEntity()).toList(),
      responseStatus: responseStatus,
    );
  }
}
