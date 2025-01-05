import 'package:phones/features/phones_details/data/dtos/phones_details_title_and_info_dto.dart';
import 'package:phones/features/phones_details/domain/entities/phones_details_entity.dart';
import 'package:phones/utils/format_functions.dart';

class PhoneDetailsDto {
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
  List<TitleAndInfoDto> networkSpecsDto = [];
  List<TitleAndInfoDto> launchSpecsDto = [];
  List<TitleAndInfoDto> bodySpecsDto = [];
  List<TitleAndInfoDto> displaySpecsDto = [];
  List<TitleAndInfoDto> platformSpecsDto = [];
  List<TitleAndInfoDto> memorySpecsDto = [];
  List<TitleAndInfoDto> mainCameraSpecsDto = [];
  List<TitleAndInfoDto> selfCameraSpecsDto = [];
  List<TitleAndInfoDto> soundSpecsDto = [];
  List<TitleAndInfoDto> commsSpecsDto = [];
  List<TitleAndInfoDto> featuresSpecsDto = [];
  List<TitleAndInfoDto> batterySpecsDto = [];
  List<TitleAndInfoDto> miscSpecsDto = [];

  PhoneDetailsDto({
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
    required this.networkSpecsDto,
    required this.launchSpecsDto,
    required this.bodySpecsDto,
    required this.displaySpecsDto,
    required this.platformSpecsDto,
    required this.memorySpecsDto,
    required this.mainCameraSpecsDto,
    required this.selfCameraSpecsDto,
    required this.soundSpecsDto,
    required this.commsSpecsDto,
    required this.featuresSpecsDto,
    required this.batterySpecsDto,
    required this.miscSpecsDto,
  });

  factory PhoneDetailsDto.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> spotlight = FormatFunctions.safeParseMap(map['spotlight']);
    Map<String, dynamic> allSpecs = FormatFunctions.safeParseMap(map['all_specs']);

    List networkSpecsFormatted = FormatFunctions.safeParseList(allSpecs['network']);
    List launchSpecsFormatted = FormatFunctions.safeParseList(allSpecs['launch']);
    List bodySpecsFormatted = FormatFunctions.safeParseList(allSpecs['body']);
    List displaySpecsFormatted = FormatFunctions.safeParseList(allSpecs['display']);
    List platformSpecsFormatted = FormatFunctions.safeParseList(allSpecs['platform']);
    List memorySpecsFormatted = FormatFunctions.safeParseList(allSpecs['memory']);
    List mainCameraSpecsFormatted = FormatFunctions.safeParseList(allSpecs['main_camera']);
    List selfCameraSpecsFormatted = FormatFunctions.safeParseList(allSpecs['self_camera']);
    List soundSpecsFormatted = FormatFunctions.safeParseList(allSpecs['sound']);
    List commsSpecsFormatted = FormatFunctions.safeParseList(allSpecs['comms']);
    List featuresSpecsFormatted = FormatFunctions.safeParseList(allSpecs['features']);
    List batterySpecsFormatted = FormatFunctions.safeParseList(allSpecs['battery']);
    List miscSpecsFormatted = FormatFunctions.safeParseList(allSpecs['misc']);

    return PhoneDetailsDto(
      releaseDate: FormatFunctions.safeParseString(spotlight['releaseDate']),
      body: FormatFunctions.safeParseString(spotlight['body']),
      os: FormatFunctions.safeParseString(spotlight['os']),
      storage: FormatFunctions.safeParseString(spotlight['storage']),
      displaySize: FormatFunctions.safeParseString(spotlight['display_size']),
      displayResolution: FormatFunctions.safeParseString(spotlight['display_resolution']),
      cameraPixels: FormatFunctions.safeParseString(spotlight['camera_pixels']),
      videoPixels: FormatFunctions.safeParseString(spotlight['video_pixels']),
      ram: FormatFunctions.safeParseString(spotlight['ram']),
      chipset: FormatFunctions.safeParseString(spotlight['chipset']),
      batterySize: FormatFunctions.safeParseString(spotlight['battery_size']),
      batteryType: FormatFunctions.safeParseString(spotlight['battery_type']),
      popularity: FormatFunctions.safeParseString(spotlight['popularity']),
      imageUrl: FormatFunctions.safeParseString(map['image_url']).replaceAll(r'\/', '/'),
      networkSpecsDto: networkSpecsFormatted.map((networkSpec) => TitleAndInfoDto.fromMap(networkSpec)).toList(),
      launchSpecsDto: launchSpecsFormatted.map((launchSpec) => TitleAndInfoDto.fromMap(launchSpec)).toList(),
      bodySpecsDto: bodySpecsFormatted.map((bodySpec) => TitleAndInfoDto.fromMap(bodySpec)).toList(),
      displaySpecsDto: displaySpecsFormatted.map((displaySpec) => TitleAndInfoDto.fromMap(displaySpec)).toList(),
      platformSpecsDto: platformSpecsFormatted.map((platformSpec) => TitleAndInfoDto.fromMap(platformSpec)).toList(),
      memorySpecsDto: memorySpecsFormatted.map((memorySpec) => TitleAndInfoDto.fromMap(memorySpec)).toList(),
      mainCameraSpecsDto:
          mainCameraSpecsFormatted.map((mainCameraSpec) => TitleAndInfoDto.fromMap(mainCameraSpec)).toList(),
      selfCameraSpecsDto:
          selfCameraSpecsFormatted.map((selfCameraSpec) => TitleAndInfoDto.fromMap(selfCameraSpec)).toList(),
      soundSpecsDto: soundSpecsFormatted.map((soundSpec) => TitleAndInfoDto.fromMap(soundSpec)).toList(),
      commsSpecsDto: commsSpecsFormatted.map((commsSpec) => TitleAndInfoDto.fromMap(commsSpec)).toList(),
      featuresSpecsDto: featuresSpecsFormatted.map((featuresSpec) => TitleAndInfoDto.fromMap(featuresSpec)).toList(),
      batterySpecsDto: batterySpecsFormatted.map((batterySpec) => TitleAndInfoDto.fromMap(batterySpec)).toList(),
      miscSpecsDto: miscSpecsFormatted.map((miscSpec) => TitleAndInfoDto.fromMap(miscSpec)).toList(),
    );
  }

  PhoneDetails toEntity() {
    return PhoneDetails(
      releaseDate: releaseDate,
      body: body,
      os: os,
      storage: storage,
      displaySize: displaySize,
      displayResolution: displayResolution,
      cameraPixels: cameraPixels,
      videoPixels: videoPixels,
      ram: ram,
      chipset: chipset,
      batterySize: batterySize,
      batteryType: batteryType,
      popularity: popularity,
      imageUrl: imageUrl,
      networkSpecs: networkSpecsDto.map((networkSpec) => networkSpec.toEntity()).toList(),
      launchSpecs: launchSpecsDto.map((launchSpec) => launchSpec.toEntity()).toList(),
      bodySpecs: bodySpecsDto.map((bodySpec) => bodySpec.toEntity()).toList(),
      displaySpecs: displaySpecsDto.map((displaySpec) => displaySpec.toEntity()).toList(),
      platformSpecs: platformSpecsDto.map((platformSpec) => platformSpec.toEntity()).toList(),
      memorySpecs: memorySpecsDto.map((memorySpec) => memorySpec.toEntity()).toList(),
      mainCameraSpecs: mainCameraSpecsDto.map((mainCameraSpec) => mainCameraSpec.toEntity()).toList(),
      selfCameraSpecs: selfCameraSpecsDto.map((selfCameraSpec) => selfCameraSpec.toEntity()).toList(),
      soundSpecs: soundSpecsDto.map((soundSpec) => soundSpec.toEntity()).toList(),
      commsSpecs: commsSpecsDto.map((commsSpec) => commsSpec.toEntity()).toList(),
      featuresSpecs: featuresSpecsDto.map((featuresSpec) => featuresSpec.toEntity()).toList(),
      batterySpecs: batterySpecsDto.map((batterySpec) => batterySpec.toEntity()).toList(),
      miscSpecs: miscSpecsDto.map((miscSpec) => miscSpec.toEntity()).toList(),
    );
  }
}
