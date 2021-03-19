import 'package:league_of_api/api/summoner_v4/models/summoner_dto.dart';
import 'package:test/test.dart';

void main() {
  group('Constructor', () {
    test('Valid dto is created', () {
      var summonerDto = SummonerDto(
        accountId: 'hEbw_NrnHM5sttr1sXEUyHfgRwDOsleNkU_00U7CKAI1atI',
        id: 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
        puuid:
            'lIQ0bUHcMziDaMWPRoYNkOSncdpF_a8-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
        name: 'DrykTheViking',
        profileIconId: 4777,
        revisionDate: 1615949557000,
        summonerLevel: 179,
      );
      expect(summonerDto, isA<SummonerDto>());
    });
  });

  group('Factory', () {
    test('fromJoson return valid dto', () {
      var json = <String, dynamic>{
        'id': 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
        'accountId': 'hEbw_NrnHM5sttr1sXEUyHfgRwDOsleNkU_00U7CKAI1atI',
        'puuid':
            'lIQ0bUHcMziDaMWPRoYNkOSncdpF_a8-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
        'name': 'DrykTheViking',
        'profileIconId': 4777,
        'revisionDate': 1615949557000,
        'summonerLevel': 179
      };
      var summonerDto = SummonerDto.fromJson(json);
      expect(summonerDto, isA<SummonerDto>());
      expect(summonerDto.puuid, equals(json['puuid']));
      expect(summonerDto.profileIconId, equals(json['profileIconId']));
    });
  });
}
