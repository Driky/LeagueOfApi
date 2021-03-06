import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_of_api/api/league_v4/models/mini_series_dto.dart';

part 'league_item_dto.g.dart';

@JsonSerializable(createToJson: false)
@MiniSeriesDtoConverter()
class LeagueItemDto extends Equatable {
  final bool freshBlood;
  final int wins;
  final String summonerName;
  final MiniSeriesDto? miniSeries;
  final bool inactive;
  final bool veteran;
  final bool hotStreak;
  final String rank;
  final int leaguePoints;
  final int losses;
  final String summonerId;

  LeagueItemDto({
    required this.freshBlood,
    required this.wins,
    required this.summonerName,
    this.miniSeries,
    required this.inactive,
    required this.veteran,
    required this.hotStreak,
    required this.rank,
    required this.leaguePoints,
    required this.losses,
    required this.summonerId,
  });

  factory LeagueItemDto.fromJson(Map<String, dynamic> json) =>
      _$LeagueItemDtoFromJson(json);

  @override
  List<Object?> get props => [
        freshBlood,
        wins,
        summonerId,
        summonerName,
        miniSeries,
        inactive,
        veteran,
        hotStreak,
        leaguePoints,
        losses
      ];

  @override
  bool get stringify => true;
}

class LeagueItemDtoConverter
    implements JsonConverter<LeagueItemDto, Map<String, dynamic>> {
  const LeagueItemDtoConverter();
  @override
  LeagueItemDto fromJson(Map<String, dynamic> json) {
    return LeagueItemDto.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LeagueItemDto object) {
    throw UnimplementedError(
        'MiniSeriesDto is read-only (generate MiniSeriesDto.toJson if it\'s no longer the case)');
  }
}
