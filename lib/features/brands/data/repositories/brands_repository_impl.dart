import 'package:phones/features/brands/data/datasources/remote/brands_datasource_remote_http.dart';
import 'package:phones/features/brands/data/dtos/brands_response_dto.dart';
import 'package:phones/features/brands/domain/entities/brands_response_entity.dart';
import 'package:phones/features/brands/domain/repositories/brands_repository.dart';

class BrandsRepositoryImpl implements BrandsRepository {
  BrandsDataSourceRemoteHttp brandsDataSourceRemoteHttp;

  BrandsRepositoryImpl({
    required this.brandsDataSourceRemoteHttp,
  });

  @override
  Future<BrandResponse> getBrands() async {
    BrandResponseDto brandResponseDto = await brandsDataSourceRemoteHttp.getBrands();

    return brandResponseDto.toEntity();
  }
}
