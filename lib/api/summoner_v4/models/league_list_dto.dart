import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:league_of_api/api/summoner_v4/models/league_item_dto.dart';

part 'league_list_dto.g.dart';

@JsonSerializable(createToJson: false)
@LeagueItemDtoConverter()
class LeagueListDTO extends Equatable {
  final String leagueId;
  final String tier;
  final String name;
  final String queue;
  final List<LeagueItemDto> entries;

  LeagueListDTO({
    required this.leagueId,
    required this.tier,
    required this.name,
    required this.queue,
    required this.entries,
  });

  factory LeagueListDTO.fromJson(Map<String, dynamic> json) =>
      _$LeagueListDTOFromJson(json);

  @override
  List<Object?> get props => [leagueId, tier, name, queue, entries];

  @override
  bool get stringify => true;
}
