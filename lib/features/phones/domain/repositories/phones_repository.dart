import 'package:phones/features/phones/domain/entities/phone_response_entity.dart';

abstract class PhonesRepository {
  Future<PhoneResponse> getPhones(String search, int brandId);
}
