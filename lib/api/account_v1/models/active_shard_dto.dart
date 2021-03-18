import 'package:json_annotation/json_annotation.dart';

part 'active_shard_dto.g.dart';

@JsonSerializable(createToJson: false)
class ActiveShardDto {
  final String puuid;
  final String game;
  final String activeShard;

  ActiveShardDto({
    required this.puuid,
    required this.game,
    required this.activeShard,
  });

  factory ActiveShardDto.fromJson(Map<String, dynamic> json) =>
      _$ActiveShardDtoFromJson(json);

  @override
  String toString() {
    return 'ActiveShardDto{puuid: $puuid, game: $game, activeShard: $activeShard}';
  }
}
