import 'package:league_of_api/api/league_v4/models/league_item_dto.dart';
import 'package:league_of_api/api/league_v4/models/mini_series_dto.dart';
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
          hotStreak: true,
          miniSeries: MiniSeriesDto(
            losses: 1,
            wins: 2,
            target: 3,
            progress: 'WLWNN',
          ));
      expect(leagueItemDto, isA<LeagueItemDto>());
      expect(leagueItemDto.miniSeries, isA<MiniSeriesDto>());
    });
  });

  group('Factory', () {
    test('fromJoson return valid dto', () {
      final miniJson = <String, dynamic>{
        'losses': 1,
        'wins': 2,
        'target': 3,
        'progress': 'WLWNN',
      };
      final json = <String, dynamic>{
        'summonerId': 'x4EtzlaOGw2Bsc_5a_RgR3Vou4tg4V6Ct6EtDTzodhehGg0',
        'summonerName': 'Acoldblazeolive',
        'leaguePoints': 666,
        'rank': 'I',
        'wins': 67,
        'losses': 48,
        'veteran': false,
        'inactive': false,
        'freshBlood': false,
        'hotStreak': true,
        'miniSeries': miniJson
      };
      var leagueItemDto = LeagueItemDto.fromJson(json);
      expect(leagueItemDto, isA<LeagueItemDto>());
      expect(leagueItemDto.rank, equals(json['rank']));
      expect(leagueItemDto.leaguePoints, equals(json['leaguePoints']));
      expect(leagueItemDto.miniSeries!.losses,
          equals(json['miniSeries']['losses']));
    });
  });
}
