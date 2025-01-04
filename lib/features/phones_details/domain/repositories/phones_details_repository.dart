import 'package:phones/features/phones_details/domain/entities/phones_details_response_entity.dart';

abstract class PhonesDetailsRepository {
  Future<PhoneDetailsResponse> getPhoneDetails(String id);
}
