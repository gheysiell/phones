import 'package:phones/features/phones_details/data/datasources/remote/phones_details_datasource_remote_http.dart';
import 'package:phones/features/phones_details/data/dtos/phones_details_response_dto.dart';
import 'package:phones/features/phones_details/domain/entities/phones_details_response_entity.dart';
import 'package:phones/features/phones_details/domain/repositories/phones_details_repository.dart';

class PhonesDetailsRepositoryImpl implements PhonesDetailsRepository {
  PhonesDetailsDataSourceRemoteHttp phonesDetailsDataSourceRemoteHttp;

  PhonesDetailsRepositoryImpl({
    required this.phonesDetailsDataSourceRemoteHttp,
  });

  @override
  Future<PhoneDetailsResponse> getPhoneDetails(String id) async {
    PhoneDetailsResponseDto phoneDetailsResponseDto = await phonesDetailsDataSourceRemoteHttp.getPhoneDetails(id);

    return phoneDetailsResponseDto.toEntity();
  }
}
