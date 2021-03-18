import 'package:league_of_api/api/account_v1/models/active_shard_dto.dart';
import 'package:test/test.dart';

void main() {
  group('Constructor', () {
    test('Valid dto is created', () {
      var activeShardDto = ActiveShardDto(
        puuid: 'test',
        activeShard: 'na',
        game: 'lor',
      );
      expect(activeShardDto, isA<ActiveShardDto>());
    });
  });

  group('Factory', () {
    test('fromJoson return valid dto', () {
      var json = <String, dynamic>{
        'puuid': 'test-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
        'game': 'lor',
        'activeShard': 'americas'
      };
      var activeShardDto = ActiveShardDto.fromJson(json);
      expect(activeShardDto.puuid, equals(json['puuid']));
      expect(activeShardDto.game, equals(json['game']));
      expect(activeShardDto.activeShard, equals(json['activeShard']));
    });
  });

  group('Methods', () {
    test('toString return expected value', () {
      var expected = 'ActiveShardDto{puuid: test, game: lor, activeShard: na}';
      var activeShardDto = ActiveShardDto(
        puuid: 'test',
        activeShard: 'na',
        game: 'lor',
      ).toString();
      expect(activeShardDto, equals(expected));
    });
  });
}
