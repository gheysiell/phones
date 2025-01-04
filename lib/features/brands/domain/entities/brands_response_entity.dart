import 'package:phones/core/enums.dart';
import 'package:phones/features/brands/domain/entities/brands_entity.dart';

class BrandResponse {
  List<Brand> brands;
  ResponseStatus responseStatus;

  BrandResponse({
    required this.brands,
    required this.responseStatus,
  });
}
