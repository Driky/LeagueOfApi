import 'package:test/test.dart';

import 'api/account_v1/models/account_dto_test.dart' as account_dto;
import 'league_of_api_test.dart' as league_of_api;
import 'riot_id_test.dart' as riot_id;
import 'tag_line_test.dart' as tag_line;

void main() {
  group('league_of_api', league_of_api.main);
  group('tag_line', tag_line.main);
  group('riot_id', riot_id.main);
  group('account_dto', account_dto.main);
}
