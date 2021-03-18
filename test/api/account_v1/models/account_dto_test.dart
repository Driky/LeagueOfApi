import 'package:league_of_api/api/account_v1/models/account_dto.dart';
import 'package:league_of_api/api/models/tag_line.dart';
import 'package:test/test.dart';

void main() {
  group('Constructor', () {
    test('Valid dto is created', () {
      var accountDto = AccountDto(
          puuid: 'testpuuid',
          gameName: 'testGameName',
          tagLine: TagLine('1234'));
      expect(accountDto, isA<AccountDto>());
    });
  });

  group('Factory', () {
    test('fromJoson return valid dto', () {
      var json = <String, dynamic>{
        'puuid':
            'lIQ0bUHcMziDaMWPRoYNkOSncdpF_a8-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
        'gameName': 'Driky',
        'tagLine': '5441',
      };
      var accountDto = AccountDto.fromJson(json);
      expect(accountDto, isA<AccountDto>());
    });
  });
}
