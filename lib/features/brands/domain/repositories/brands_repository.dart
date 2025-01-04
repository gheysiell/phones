import 'package:phones/features/brands/domain/entities/brands_response_entity.dart';

abstract class BrandsRepository {
  Future<BrandResponse> getBrands();
}
