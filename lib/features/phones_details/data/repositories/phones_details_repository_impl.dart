import 'package:phones/core/enums.dart';
import 'package:phones/features/phones_details/data/datasources/remote/phones_details_datasource_remote_http.dart';
import 'package:phones/features/phones_details/data/dtos/phones_details_response_dto.dart';
import 'package:phones/features/phones_details/domain/entities/phones_details_response_entity.dart';
import 'package:phones/features/phones_details/domain/repositories/phones_details_repository.dart';
import 'package:phones/utils/functions.dart';

class PhonesDetailsRepositoryImpl implements PhonesDetailsRepository {
  PhonesDetailsDataSourceRemoteHttp phonesDetailsDataSourceRemoteHttp;

  PhonesDetailsRepositoryImpl({
    required this.phonesDetailsDataSourceRemoteHttp,
  });

  @override
  Future<PhoneDetailsResponse> getPhoneDetails(String id) async {
    if (!await Functions.checkConn()) {
      return PhoneDetailsResponse(
        phoneDetails: null,
        responseStatus: ResponseStatus.noConnection,
      );
    }

    PhoneDetailsResponseDto phoneDetailsResponseDto = await phonesDetailsDataSourceRemoteHttp.getPhoneDetails(id);

    return phoneDetailsResponseDto.toEntity();
  }
}
