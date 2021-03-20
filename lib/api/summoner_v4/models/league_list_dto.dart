import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_of_api/api/summoner_v4/models/league_item_dto.dart';

part 'league_list_dto.g.dart';

@JsonSerializable(createToJson: false)
@LeagueItemDtoConverter()
class LeagueListDto extends Equatable {
  final String leagueId;
  final String tier;
  final String name;
  final String queue;
  final List<LeagueItemDto> entries;

  LeagueListDto({
    required this.leagueId,
    required this.tier,
    required this.name,
    required this.queue,
    required this.entries,
  });

  factory LeagueListDto.fromJson(Map<String, dynamic> json) =>
      _$LeagueListDtoFromJson(json);

  @override
  List<Object?> get props => [leagueId, tier, name, queue, entries];

  @override
  bool get stringify => true;
}
