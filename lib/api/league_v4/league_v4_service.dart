import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:league_of_api/api/base_service.dart';
import 'package:league_of_api/api/consts/apex_ranks.dart';
import 'package:league_of_api/api/consts/divisions.dart';
import 'package:league_of_api/api/consts/platform_routing_values.dart';
import 'package:league_of_api/api/consts/queue.dart';
import 'package:league_of_api/api/consts/tiers.dart';
import 'package:league_of_api/api/league_v4/models/league_entry_dto.dart';
import 'package:league_of_api/api/league_v4/models/league_list_dto.dart';

class LeagueV4Service extends BaseService {
  const LeagueV4Service(Dio client) : super(client);

  Future<List<LeagueEntryDto>> getAllLeagueEntriesByQueueAndTierAndDivision(
      PlatformRoutingValue region, Queue queue, Tier tier, Division division,
      [int? page]) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/league/v4/entries/${QUEUES[queue]}/${TIERS[tier]}/${DIVISIONS[division]}';
    final queryParameters =
        page != null ? <String, dynamic>{'page': page} : null;
    final response = await get(url, queryParameters: queryParameters);

    return List<LeagueEntryDto>.from(
        response!.data.map((entryJson) => LeagueEntryDto.fromJson(entryJson)));
  }

  Future<LeagueListDto> getLeagueById(
      PlatformRoutingValue region, String leagueId) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/league/v4/leagues/$leagueId';
    final response = await get(url);

    return LeagueListDto.fromJson(response!.data);
  }

  Future<LeagueListDto> getChallengerLeagueByQueue(
    PlatformRoutingValue region,
    Queue selectedQueue,
  ) async {
    return _getApexLeagueByQueueAndApexRank(
        region, selectedQueue, ApexRank.Challenger);
  }

  Future<LeagueListDto> getMasterLeagueByQueue(
    PlatformRoutingValue region,
    Queue selectedQueue,
  ) async {
    return _getApexLeagueByQueueAndApexRank(
        region, selectedQueue, ApexRank.Master);
  }

  Future<LeagueListDto> getGrandmasterLeagueByQueue(
    PlatformRoutingValue region,
    Queue selectedQueue,
  ) async {
    return _getApexLeagueByQueueAndApexRank(
        region, selectedQueue, ApexRank.Grandmaster);
  }

  Future<List<LeagueEntryDto>> getLeagueEntriesInAllQueuesBySummonerId(
    PlatformRoutingValue region,
    String summonerId,
  ) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/league/v4/entries/by-summoner/$summonerId';
    final response = await get(url);

    return List<LeagueEntryDto>.from(
        response!.data.map((entryJson) => LeagueEntryDto.fromJson(entryJson)));
  }

  Future<LeagueListDto> _getApexLeagueByQueueAndApexRank(
      PlatformRoutingValue region,
      Queue selectedQueue,
      ApexRank apexRank) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/league/v4/${APEX_RANKS[apexRank]}leagues/by-queue/${QUEUES[selectedQueue]}';
    final response = await get(url);

    return LeagueListDto.fromJson(response!.data);
  }
}
