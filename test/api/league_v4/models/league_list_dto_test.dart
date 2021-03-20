import 'package:league_of_api/api/league_v4/models/league_item_dto.dart';
import 'package:league_of_api/api/league_v4/models/league_list_dto.dart';
import 'package:league_of_api/api/league_v4/models/mini_series_dto.dart';
import 'package:test/test.dart';

void main() {
  late LeagueItemDto leagueItemDto;
  late LeagueItemDto leagueItemDto2;
  late LeagueListDto leagueListDto;

  setUp(() {
    leagueItemDto = LeagueItemDto(
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
    leagueItemDto2 = LeagueItemDto(
      summonerId: 'x4EtzsdfsfsfsfsfVou4tg4V6Ct6EtDTzodhehGg0',
      summonerName: 'Dudeman',
      leaguePoints: 777,
      rank: 'I',
      wins: 50,
      losses: 30,
      veteran: false,
      inactive: false,
      freshBlood: false,
      hotStreak: false,
    );
    leagueListDto = LeagueListDto(
        name: 'Alistar\'s Captains',
        leagueId: '2bd81059-a0ce-33d4-9fb0-86977c851f64',
        queue: 'RANKED_SOLO_5x5',
        tier: 'CHALLENGER',
        entries: [leagueItemDto, leagueItemDto2]);
  });

  group('Constructor', () {
    test('Valid dto is created', () {
      expect(leagueListDto, isA<LeagueListDto>());
    });
  });

  group('Factory', () {
    test('fromJoson return valid dto', () {
      var json = <String, dynamic>{
        'tier': 'CHALLENGER',
        'leagueId': '2bd81059-a0ce-33d4-9fb0-86977c851f64',
        'queue': 'RANKED_SOLO_5x5',
        'name': "Alistar's Captains",
        'entries': [
          {
            'summonerId': 'ZIzltRFq-1bsl7QeOgw3uMYVe-ycpLKJ7DljbXisrxWk',
            'summonerName': 'Cody Sun',
            'leaguePoints': 771,
            'rank': 'I',
            'wins': 197,
            'losses': 176,
            'veteran': false,
            'inactive': false,
            'freshBlood': false,
            'hotStreak': true,
            'miniSeries': {
              'losses': 1,
              'wins': 2,
              'target': 3,
              'progress': 'WLWNN',
            }
          },
          {
            'summonerId':
                'qqa-rxMaCrCadbddYlwMQGPHQVeteq7D4F2JF8d0hsgSl_3KjbJseqE24A',
            'summonerName': 'TempoSpacer',
            'leaguePoints': 758,
            'rank': 'I',
            'wins': 91,
            'losses': 77,
            'veteran': false,
            'inactive': false,
            'freshBlood': false,
            'hotStreak': false
          }
        ]
      };
      var leagueListDtoFromJson = LeagueListDto.fromJson(json);
      expect(leagueListDtoFromJson, isA<LeagueListDto>());
      expect(leagueListDtoFromJson.queue, equals(json['queue']));
      expect(leagueListDtoFromJson.name, equals(json['name']));
      expect(leagueListDtoFromJson.entries, isA<List<LeagueItemDto>>());
      expect(
          leagueListDtoFromJson.entries
              .where((leagueItem) => leagueItem.miniSeries != null)
              .first
              .miniSeries,
          isA<MiniSeriesDto>());
    });
  });
}
