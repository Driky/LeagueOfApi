import 'package:dio/dio.dart';
import 'package:league_of_api/api/account_v1/models/account_dto.dart';
import 'package:league_of_api/api/base_service.dart';
import 'package:league_of_api/api/consts/games.dart';
import 'package:league_of_api/api/consts/region_routing_values.dart';
import 'package:league_of_api/api/models/riot_id.dart';

import 'models/active_shard_dto.dart';

class AccountV1Service extends BaseService {
  const AccountV1Service(Dio client) : super(client);

  Future<AccountDto> getAccountByRiotId(
    RegionRoutingValue region,
    RiotId rid,
  ) async {
    final url =
        'https://${REGION_ROUTING_VALUES[region]}/riot/account/v1/accounts/by-riot-id/${rid.gameName}/${rid.tagLine}';
    final response = await get(url);

    return AccountDto.fromJson(response!.data);
  }

  Future<AccountDto> getAccountByPuuid(
    RegionRoutingValue region,
    String puuid,
  ) async {
    final url =
        'https://${REGION_ROUTING_VALUES[region]}/riot/account/v1/accounts/by-puuid/$puuid';
    final response = await get(url);

    return AccountDto.fromJson(response!.data);
  }

  Future<ActiveShardDto> getActiveShardForAPlayer(
    RegionRoutingValue region,
    Game game,
    String puuid,
  ) async {
    final url =
        'https://${REGION_ROUTING_VALUES[region]}/riot/account/v1/active-shards/by-game/${GAMES[game]}/by-puuid/$puuid';
    final response = await get(url);

    return ActiveShardDto.fromJson(response!.data);
  }
}
