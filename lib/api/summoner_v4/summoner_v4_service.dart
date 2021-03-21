import 'package:dio/dio.dart';
import 'package:league_of_api/api/base_service.dart';
import 'package:league_of_api/api/consts/platform_routing_values.dart';

import 'models/summoner_dto.dart';

class SummonerV4Service extends BaseService {
  const SummonerV4Service(Dio client) : super(client);

  Future<SummonerDto> getSummonerBySummonerName(
    PlatformRoutingValue region,
    String summonerName,
  ) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/summoner/v4/summoners/by-name/$summonerName';
    final response = await get(url);

    return SummonerDto.fromJson(response!.data);
  }

  Future<SummonerDto> getSummonerByAccountId(
    PlatformRoutingValue region,
    String accountId,
  ) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/summoner/v4/summoners/by-account/$accountId';
    final response = await get(url);

    return SummonerDto.fromJson(response!.data);
  }

  Future<SummonerDto> getSummonerByPuuid(
    PlatformRoutingValue region,
    String puuid,
  ) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/summoner/v4/summoners/by-puuid/$puuid';
    final response = await get(url);

    return SummonerDto.fromJson(response!.data);
  }

  Future<SummonerDto> getSummonerBySummonerId(
    PlatformRoutingValue region,
    String sumonerId,
  ) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/summoner/v4/summoners/$sumonerId';
    final response = await get(url);

    return SummonerDto.fromJson(response!.data);
  }
}
