import 'package:phones/features/phones/domain/entities/phone_response_entity.dart';
import 'package:phones/features/phones/domain/repositories/phones_repository.dart';

class PhonesUseCase {
  PhonesRepository phonesRepository;

  PhonesUseCase({
    required this.phonesRepository,
  });

  Future<PhoneResponse> getPhones(String search, int brandId) async {
    return await phonesRepository.getPhones(search, brandId);
  }
}
