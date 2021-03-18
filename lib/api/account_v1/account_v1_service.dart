import 'package:dio/dio.dart';
import 'package:league_of_api/api/account_v1/models/account_dto.dart';
import 'package:league_of_api/api/consts/error_status_codes.dart';
import 'package:league_of_api/api/consts/games.dart';
import 'package:league_of_api/api/consts/region_routing_values.dart';
import 'package:league_of_api/api/models/riot_id.dart';

import 'models/active_shard_dto.dart';

class AccountV1Service {
  final Dio _client;

  const AccountV1Service(this._client);

  Future<AccountDto> getAccountByRiotId(
    RegionRoutingValue region,
    RiotId rid,
  ) async {
    final url =
        'https://${REGION_ROUTING_VALUES[region]}/riot/account/v1/accounts/by-riot-id/${rid.gameName}/${rid.tagLine}';
    final response = await _get(url);

    return AccountDto.fromJson(response!.data);
  }

  Future<AccountDto> getAccountByPuuid(
    RegionRoutingValue region,
    String puuid,
  ) async {
    final url =
        'https://${REGION_ROUTING_VALUES[region]}/riot/account/v1/accounts/by-puuid/$puuid';
    final response = await _get(url);

    return AccountDto.fromJson(response!.data);
  }

  Future<ActiveShardDto> getActiveShardForAPlayer(
    RegionRoutingValue region,
    Game game,
    String puuid,
  ) async {
    final url =
        'https://${REGION_ROUTING_VALUES[region]}/riot/account/v1/active-shards/by-game/${GAMES[game]}/by-puuid/$puuid';
    final response = await _get(url);

    return ActiveShardDto.fromJson(response!.data);
  }

  Future<Response?>? _get(String url) async {
    Response? response;
    try {
      response = await _client.get(url);
    } on DioError catch (error) {
      if (error.response != null) {
        if (ERROR_STATUS_CODES.keys.contains(error.response?.statusCode)) {
          throw Exception(ERROR_STATUS_CODES[error.response?.statusCode]);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(error.requestOptions);
        print(error.message);
        rethrow;
      }
    }

    return response;
  }
}
