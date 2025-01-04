import 'package:phones/core/enums.dart';
import 'package:phones/features/phones/domain/entities/phones_entity.dart';

class PhoneResponse {
  List<Phone> phones = [];
  ResponseStatus responseStatus;

  PhoneResponse({
    required this.phones,
    required this.responseStatus,
  });
}
