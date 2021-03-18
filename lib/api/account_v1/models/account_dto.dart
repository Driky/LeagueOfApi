import 'package:json_annotation/json_annotation.dart';
import 'package:league_of_api/api/models/tag_line.dart';

part 'account_dto.g.dart';

@JsonSerializable(createToJson: false)
class AccountDto {
  final String puuid;
  final String gameName;
  @JsonKey(fromJson: _tagLineFromJson)
  final TagLine tagLine;

  AccountDto({
    required this.puuid,
    required this.gameName,
    required this.tagLine,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);

  static TagLine _tagLineFromJson(String value) => TagLine(value);

  @override
  String toString() {
    return 'AccountDto{puuid: $puuid, gameName: $gameName, tagLine: $tagLine}';
  }
}
