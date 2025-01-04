import 'dart:async';
import 'package:phones/core/enums.dart';
import 'package:phones/features/phones/data/datasources/remote/phones_datasource_remote_http.dart';
import 'package:phones/features/phones/data/dtos/phones_response_dto.dart';
import 'package:phones/features/phones/domain/entities/phone_response_entity.dart';
import 'package:phones/features/phones/domain/repositories/phones_repository.dart';
import 'package:phones/utils/functions.dart';

class PhonesRepositoryImpl implements PhonesRepository {
  PhonesDataSourceRemoteHttp phonesDataSourceRemoteHttp;

  PhonesRepositoryImpl({
    required this.phonesDataSourceRemoteHttp,
  });

  @override
  Future<PhoneResponse> getPhones(String search, int brandId) async {
    if (!await Functions.checkConn()) {
      return PhoneResponse(
        phones: [],
        responseStatus: ResponseStatus.noConnection,
      );
    }

    PhoneResponseDto phoneResponseDto = await phonesDataSourceRemoteHttp.getPhones(search, brandId);

    return phoneResponseDto.toEntity();
  }
}
