import 'package:phones/features/brands/domain/entities/brands_entity.dart';
import 'package:phones/features/brands/domain/entities/brands_response_entity.dart';
import 'package:phones/features/brands/domain/repositories/brands_repository.dart';

class BrandsUseCase {
  BrandsRepository brandsRepository;

  BrandsUseCase({
    required this.brandsRepository,
  });

  Future<BrandResponse> getBrands() async {
    BrandResponse brandResponse = await brandsRepository.getBrands();

    for (Brand brand in brandResponse.brands) {
      brand.format();
    }

    return brandResponse;
  }
}
