import 'package:flutter/material.dart';
import 'package:phones/core/enums.dart';
import 'package:phones/features/phones_details/domain/entities/phones_details_entity.dart';
import 'package:phones/features/phones_details/domain/entities/phones_details_response_entity.dart';
import 'package:phones/features/phones_details/domain/usecases/phones_details_usecase.dart';
import 'package:phones/utils/functions.dart';

class PhonesDetailsViewModel extends ChangeNotifier {
  PhoneDetails? phoneDetails;
  bool loading = false;
  PhonesDetailsUseCase phonesDetailsUseCase;

  PhonesDetailsViewModel({
    required this.phonesDetailsUseCase,
  });

  void setPhoneDetails(PhoneDetails? value) {
    phoneDetails = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> getPhoneDetails(String id) async {
    setLoading(true);

    final PhoneDetailsResponse phoneDetailsResponse = await phonesDetailsUseCase.getPhoneDetails(id);

    setLoading(false);

    if (phoneDetailsResponse.responseStatus != ResponseStatus.success) {
      await Functions.showMessageResponseStatus(
        phoneDetailsResponse.responseStatus,
        'Buscar',
        'os',
        'detalhes do celular',
      );
    }

    setPhoneDetails(phoneDetailsResponse.phoneDetails);
  }
}
