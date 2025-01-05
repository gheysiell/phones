import 'package:flutter/material.dart';
import 'package:phones/core/enums.dart';
import 'package:phones/features/brands/domain/entities/brands_entity.dart';
import 'package:phones/features/brands/domain/entities/brands_response_entity.dart';
import 'package:phones/features/brands/domain/usecases/brands_usecase.dart';
import 'package:phones/features/phones/domain/entities/phone_response_entity.dart';
import 'package:phones/features/phones/domain/entities/phones_entity.dart';
import 'package:phones/features/phones/domain/usecases/phones_usecase.dart';
import 'package:phones/utils/functions.dart';

class PhonesViewModel extends ChangeNotifier {
  List<Phone> phones = [];
  List<Brand> brands = [];
  PhonesUseCase phonesUseCase;
  BrandsUseCase brandsUseCase;
  bool loading = false;
  bool loadingBrands = false;
  bool searchVisible = false;
  bool makingSearch = false;
  int indexBrandSelected = 0;

  PhonesViewModel({
    required this.phonesUseCase,
    required this.brandsUseCase,
  });

  void setPhones(List<Phone> value) {
    phones = value;
    notifyListeners();
  }

  void setBrands(List<Brand> value) {
    brands = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void setLoadingBrands(bool value) {
    loadingBrands = value;
    notifyListeners();
  }

  void setSearchVisible(bool value) {
    searchVisible = value;
    notifyListeners();
  }

  void setMakingSearch(bool value) {
    makingSearch = value;
    notifyListeners();
  }

  void setIndexBrandSelected(int value) {
    indexBrandSelected = value;
    notifyListeners();
  }

  Future<void> getBrands() async {
    setLoadingBrands(true);

    BrandResponse brandResponse = await brandsUseCase.getBrands();

    setLoadingBrands(false);

    if (brandResponse.responseStatus != ResponseStatus.success) {
      Functions.showMessageResponseStatus(
        brandResponse.responseStatus,
        'Buscar',
        'as',
        'marcas',
      );
    }

    setBrands(brandResponse.brands);
  }

  Future<void> getPhones(String search, int brandId) async {
    setMakingSearch(search.isNotEmpty);
    setSearchVisible(search.isNotEmpty);

    setLoading(true);

    PhoneResponse phoneResponse = await phonesUseCase.getPhones(search, brandId);

    setLoading(false);

    if (phoneResponse.responseStatus != ResponseStatus.success) {
      Functions.showMessageResponseStatus(
        phoneResponse.responseStatus,
        'Buscar',
        'os',
        'celulares',
      );
    }

    setPhones(phoneResponse.phones);
  }
}
