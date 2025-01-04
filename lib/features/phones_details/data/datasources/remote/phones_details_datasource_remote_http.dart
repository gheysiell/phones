import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:phones/core/constants.dart';
import 'package:phones/core/enums.dart';
import 'package:phones/features/phones_details/data/dtos/phones_details_dto.dart';
import 'package:phones/features/phones_details/data/dtos/phones_details_response_dto.dart';

abstract class PhonesDetailsDataSourceRemoteHttp {
  Future<PhoneDetailsResponseDto> getPhoneDetails(String id);
}

class PhonesDetailsDataSourceRemoteHttpImpl implements PhonesDetailsDataSourceRemoteHttp {
  @override
  Future<PhoneDetailsResponseDto> getPhoneDetails(String id) async {
    PhoneDetailsResponseDto phoneDetailsResponseDto = PhoneDetailsResponseDto(
      phoneDetailsDto: null,
      responseStatus: ResponseStatus.success,
    );
    final Uri uri = Uri.parse('${Constants.baseUrl}/13123123');
    final Map<String, String> header = {
      'Authorization': 'Bearer ${Constants.apiKey}',
    };

    try {
      final response = await http.get(uri, headers: header);

      if (response.statusCode != 200) {
        log('bad request in PhonesDetailsDataSourceRemoteHttpImpl.getPhoneDetails',
            error: 'statusCode: ${response.statusCode} | response: ${response.body}');
        throw Exception();
      }

      Map<String, dynamic> body = json.decode(response.body);

      phoneDetailsResponseDto.phoneDetailsDto = PhoneDetailsDto.fromMap(body);
    } on TimeoutException {
      log('${Constants.timeoutGenericMessage} PhonesDetailsDataSourceRemoteHttpImpl.getPhoneDetails');
      phoneDetailsResponseDto.responseStatus = ResponseStatus.timeout;
    } catch (e) {
      log('${Constants.generalGenericMessage} PhonesDetailsDataSourceRemoteHttpImpl.getPhoneDetails', error: e);
      phoneDetailsResponseDto.responseStatus = ResponseStatus.error;
    }

    return phoneDetailsResponseDto;
  }
}
