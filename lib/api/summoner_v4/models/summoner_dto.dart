import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summoner_dto.g.dart';

@JsonSerializable(createToJson: false)
class SummonerDto extends Equatable {
  final String accountId;
  final int profileIconId;
  final int revisionDate;
  final String name;
  final String id;
  final String puuid;
  final int summonerLevel;

  SummonerDto({
    required this.accountId,
    required this.profileIconId,
    required this.revisionDate,
    required this.name,
    required this.id,
    required this.puuid,
    required this.summonerLevel,
  });

  factory SummonerDto.fromJson(Map<String, dynamic> json) =>
      _$SummonerDtoFromJson(json);

  @override
  List<Object?> get props =>
      [accountId, profileIconId, revisionDate, name, id, puuid, summonerLevel];

  @override
  bool get stringify => true;
}
