import 'package:phones/features/phones_details/domain/entities/phones_details_response_entity.dart';
import 'package:phones/features/phones_details/domain/repositories/phones_details_repository.dart';

class PhonesDetailsUseCase {
  PhonesDetailsRepository phonesDetailsRepository;

  PhonesDetailsUseCase({
    required this.phonesDetailsRepository,
  });

  Future<PhoneDetailsResponse> getPhoneDetails(String id) async {
    return await phonesDetailsRepository.getPhoneDetails(id);
  }
}
