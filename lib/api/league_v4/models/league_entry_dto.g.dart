// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueEntryDto _$LeagueEntryDtoFromJson(Map<String, dynamic> json) {
  return LeagueEntryDto(
    summonerName: json['summonerName'] as String,
    miniSeries: json['miniSeries'] == null
        ? null
        : MiniSeriesDto.fromJson(json['miniSeries'] as Map<String, dynamic>),
    inactive: json['inactive'] as bool,
    freshBlood: json['freshBlood'] as bool,
    veteran: json['veteran'] as bool,
    hotStreak: json['hotStreak'] as bool,
    losses: json['losses'] as int,
    wins: json['wins'] as int,
    leaguePoints: json['leaguePoints'] as int,
    rank: json['rank'] as String,
    tier: json['tier'] as String,
    queueType: json['queueType'] as String,
    summonerId: json['summonerId'] as String,
    leagueId: json['leagueId'] as String,
  );
}
