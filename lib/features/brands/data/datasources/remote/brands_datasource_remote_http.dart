import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:phones/core/constants.dart';
import 'package:phones/core/enums.dart';
import 'package:phones/features/brands/data/dtos/brands_dto.dart';
import 'package:phones/features/brands/data/dtos/brands_response_dto.dart';

abstract class BrandsDataSourceRemoteHttp {
  Future<BrandResponseDto> getBrands();
}

class BrandsDataSourceRemoteHttpImpl implements BrandsDataSourceRemoteHttp {
  @override
  Future<BrandResponseDto> getBrands() async {
    BrandResponseDto brandResponseDto = BrandResponseDto(
      brandsDto: [],
      responseStatus: ResponseStatus.success,
    );
    final Uri uri = Uri.parse('${Constants.baseUrl}2162/get+brands');
    final Map<String, String> header = {
      'Authorization': 'Bearer ${Constants.apiKey}',
    };

    try {
      final response = await http.get(uri, headers: header).timeout(Constants.timeoutHttpDuration);

      if (response.statusCode != 200) {
        throw Exception();
      }

      List brandsResponse = json.decode(response.body)['data'];

      brandResponseDto.brandsDto = brandsResponse.map((brand) => BrandDto.fromMap(brand)).toList();
    } on TimeoutException {
      log('${Constants.timeoutGenericMessage} BrandsDataSourceRemoteHttpImpl.getBrands');
      brandResponseDto.responseStatus = ResponseStatus.timeout;
    } catch (e) {
      log('${Constants.generalGenericMessage} BrandsDataSourceRemoteHttpImpl.getBrands', error: e);
      brandResponseDto.responseStatus = ResponseStatus.error;
    }

    return brandResponseDto;
  }
}
