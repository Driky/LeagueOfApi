// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueListDto _$LeagueListDtoFromJson(Map<String, dynamic> json) {
  return LeagueListDto(
    leagueId: json['leagueId'] as String,
    tier: json['tier'] as String,
    name: json['name'] as String,
    queue: json['queue'] as String,
    entries: (json['entries'] as List<dynamic>)
        .map((e) =>
            const LeagueItemDtoConverter().fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
