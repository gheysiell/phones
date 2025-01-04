import 'package:phones/core/enums.dart';
import 'package:phones/features/phones_details/domain/entities/phones_details_entity.dart';

class PhoneDetailsResponse {
  PhoneDetails? phoneDetails;
  ResponseStatus responseStatus;

  PhoneDetailsResponse({
    required this.phoneDetails,
    required this.responseStatus,
  });
}
