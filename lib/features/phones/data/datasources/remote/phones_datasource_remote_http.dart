import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:phones/core/constants.dart';
import 'package:phones/core/enums.dart';
import 'package:phones/features/phones/data/dtos/phones_dto.dart';
import 'package:phones/features/phones/data/dtos/phones_response_dto.dart';
import 'package:http/http.dart' as http;

abstract class PhonesDataSourceRemoteHttp {
  Future<PhoneResponseDto> getPhones(String search, int brandId);
}

class PhonesDataSourceRemoteHttpImpl implements PhonesDataSourceRemoteHttp {
  @override
  Future<PhoneResponseDto> getPhones(String search, int brandId) async {
    final String formattedUrl = search.isEmpty
        ? '${Constants.baseUrl}2163/get+phone+by+brand?brand_id=$brandId'
        : '${Constants.baseUrl}2165/search?q=$search';
    final Uri uri = Uri.parse(formattedUrl);
    final Map<String, String> header = {
      'Authorization': 'Bearer ${Constants.apiKey}',
    };
    final PhoneResponseDto phoneResponseDto = PhoneResponseDto(
      phonesDto: [],
      responseStatus: ResponseStatus.success,
    );

    try {
      final response = await http.get(uri, headers: header).timeout(Constants.timeoutHttpDuration);

      if (response.statusCode != 200) {
        log('bad request in PhonesDataSourceRemoteHttpImpl.getPhones',
            error: 'statusCode: ${response.statusCode} | response: ${response.body}');
        throw Exception();
      }

      List<dynamic> phones = json.decode(response.body)['data'];

      phoneResponseDto.phonesDto = phones.map((phone) => PhoneDto.fromMap(phone)).toList();
    } on TimeoutException {
      log('${Constants.timeoutGenericMessage} PhonesDataSourceRemoteHttpImpl.getPhones');
      phoneResponseDto.responseStatus = ResponseStatus.timeout;
    } catch (e) {
      log('${Constants.generalGenericMessage} PhonesDataSourceRemoteHttpImpl.getPhones', error: e);
      phoneResponseDto.responseStatus = ResponseStatus.error;
    }
    return phoneResponseDto;
  }
}
