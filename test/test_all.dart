import 'package:test/test.dart';

import 'api/account_v1/account_v1_service_test.dart' as account_v1_service;
import 'api/account_v1/models/account_dto_test.dart' as account_dto;
import 'api/account_v1/models/active_shard_dto_test.dart' as active_shard_dto;
import 'api/models/riot_id_test.dart' as riot_id;
import 'api/models/tag_line_test.dart' as tag_line;
import 'api/summoner_v4/models/league_item_dto_test.dart' as league_item_dto;
import 'api/summoner_v4/models/league_list_dto_test.dart' as league_list_dto;
import 'api/summoner_v4/models/mini_series_dto_test.dart' as mini_series_dto;
import 'api/summoner_v4/models/summoner_dto_test.dart' as summoner_dto;
import 'api/summoner_v4/summoner_v4_service_test.dart' as summoner_v4_service;
import 'league_of_api_test.dart' as league_of_api;

void main() {
  group('league_of_api', league_of_api.main);
  group('tag_line', tag_line.main);
  group('riot_id', riot_id.main);
  group('account_dto', account_dto.main);
  group('summoner_dto', summoner_dto.main);
  group('league_list_dto', league_list_dto.main);
  group('league_item_dto', league_item_dto.main);
  group('mini_series_dto', mini_series_dto.main);
  group('active_shard_dto', active_shard_dto.main);
  group('account_v1_service', account_v1_service.main);
  group('summoner_v4_service', summoner_v4_service.main);
}
