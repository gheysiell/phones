import 'package:phones/features/phones_details/domain/entities/phones_details_title_and_info_entity.dart';
import 'package:phones/utils/format_functions.dart';

class TitleAndInfoDto {
  String title, info;

  TitleAndInfoDto({
    required this.title,
    required this.info,
  });

  factory TitleAndInfoDto.fromMap(Map<String, dynamic> map) {
    return TitleAndInfoDto(
      title: FormatFunctions.safeParseString(map['title']),
      info: FormatFunctions.safeParseString(map['info']),
    );
  }

  TitleAndInfo toEntity() {
    return TitleAndInfo(
      title: title,
      info: info,
    );
  }
}
