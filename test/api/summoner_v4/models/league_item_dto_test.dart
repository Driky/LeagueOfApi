import 'package:league_of_api/api/summoner_v4/models/league_item_dto.dart';
import 'package:test/test.dart';

void main() {
  group('Constructor', () {
    test('Valid dto is created', () {
      var leagueItemDto = LeagueItemDto(
          summonerId: 'x4EtzlaOGw2Bsc_5a_RgR3Vou4tg4V6Ct6EtDTzodhehGg0',
          summonerName: 'Acoldblazeolive',
          leaguePoints: 666,
          rank: 'I',
          wins: 67,
          losses: 48,
          veteran: false,
          inactive: false,
          freshBlood: false,
          hotStreak: true);
      expect(leagueItemDto, isA<LeagueItemDto>());
    });
  });

  group('Factory', () {
    test('fromJoson return valid dto', () {
      var json = <String, dynamic>{
        'summonerId': 'x4EtzlaOGw2Bsc_5a_RgR3Vou4tg4V6Ct6EtDTzodhehGg0',
        'summonerName': 'Acoldblazeolive',
        'leaguePoints': 666,
        'rank': 'I',
        'wins': 67,
        'losses': 48,
        'veteran': false,
        'inactive': false,
        'freshBlood': false,
        'hotStreak': true
      };
      var leagueItemDto = LeagueItemDto.fromJson(json);
      expect(leagueItemDto, isA<LeagueItemDto>());
      expect(leagueItemDto.rank, equals(json['rank']));
      expect(leagueItemDto.leaguePoints, equals(json['leaguePoints']));
    });
  });
}
