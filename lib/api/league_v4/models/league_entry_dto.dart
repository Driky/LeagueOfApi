import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_of_api/api/league_v4/models/mini_series_dto.dart';

part 'league_entry_dto.g.dart';

@JsonSerializable(createToJson: false)
@MiniSeriesDtoConverter()
class LeagueEntryDto extends Equatable {
  final String summonerName;
  final MiniSeriesDto? miniSeries;
  final bool inactive;
  final bool freshBlood;
  final bool veteran;
  final bool hotStreak;
  final int losses;
  final int wins;
  final int leaguePoints;
  final String rank;
  final String tier;
  final String queueType;
  final String summonerId;
  final String leagueId;

  LeagueEntryDto({
    required this.summonerName,
    this.miniSeries,
    required this.inactive,
    required this.freshBlood,
    required this.veteran,
    required this.hotStreak,
    required this.losses,
    required this.wins,
    required this.leaguePoints,
    required this.rank,
    required this.tier,
    required this.queueType,
    required this.summonerId,
    required this.leagueId,
  });

  factory LeagueEntryDto.fromJson(Map<String, dynamic> json) =>
      _$LeagueEntryDtoFromJson(json);

  @override
  List<Object?> get props => [
        summonerName,
        miniSeries,
        inactive,
        freshBlood,
        veteran,
        hotStreak,
        losses,
        wins,
        leaguePoints,
        rank,
        tier,
        queueType,
        summonerId,
        leagueId
      ];

  @override
  bool get stringify => true;
}
