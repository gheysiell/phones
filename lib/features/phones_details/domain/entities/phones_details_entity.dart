import 'package:phones/features/phones_details/domain/entities/phones_details_title_and_info_entity.dart';

class PhoneDetails {
  String releaseDate,
      body,
      os,
      storage,
      displaySize,
      displayResolution,
      cameraPixels,
      videoPixels,
      ram,
      chipset,
      batterySize,
      batteryType,
      popularity,
      imageUrl;
  List<TitleAndInfo> networkSpecs = [];
  List<TitleAndInfo> launchSpecs = [];
  List<TitleAndInfo> bodySpecs = [];
  List<TitleAndInfo> displaySpecs = [];
  List<TitleAndInfo> platformSpecs = [];
  List<TitleAndInfo> memorySpecs = [];
  List<TitleAndInfo> mainCameraSpecs = [];
  List<TitleAndInfo> selfCameraSpecs = [];
  List<TitleAndInfo> soundSpecs = [];
  List<TitleAndInfo> commsSpecs = [];
  List<TitleAndInfo> featuresSpecs = [];
  List<TitleAndInfo> batterySpecs = [];
  List<TitleAndInfo> miscSpecs = [];

  PhoneDetails({
    required this.releaseDate,
    required this.body,
    required this.os,
    required this.storage,
    required this.displaySize,
    required this.displayResolution,
    required this.cameraPixels,
    required this.videoPixels,
    required this.ram,
    required this.chipset,
    required this.batterySize,
    required this.batteryType,
    required this.popularity,
    required this.imageUrl,
    required this.networkSpecs,
    required this.launchSpecs,
    required this.bodySpecs,
    required this.displaySpecs,
    required this.platformSpecs,
    required this.memorySpecs,
    required this.mainCameraSpecs,
    required this.selfCameraSpecs,
    required this.soundSpecs,
    required this.commsSpecs,
    required this.featuresSpecs,
    required this.batterySpecs,
    required this.miscSpecs,
  });
}
