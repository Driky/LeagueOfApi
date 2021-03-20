import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:league_of_api/api/consts/apex_ranks.dart';
import 'package:league_of_api/api/consts/divisions.dart';
import 'package:league_of_api/api/consts/error_status_codes.dart';
import 'package:league_of_api/api/consts/platform_routing_values.dart';
import 'package:league_of_api/api/consts/queue.dart';
import 'package:league_of_api/api/consts/tiers.dart';
import 'package:league_of_api/api/league_v4/models/league_entry_dto.dart';
import 'package:league_of_api/api/league_v4/models/league_list_dto.dart';

class LeagueV4Service {
  final Dio _client;

  const LeagueV4Service(this._client);

  Future<List<LeagueEntryDto>> getAllLeagueEntriesByQueueAndTierAndDivision(
      PlatformRoutingValue region, Queue queue, Tier tier, Division division,
      [int? page]) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/league/v4/entries/${QUEUES[queue]}/${TIERS[tier]}/${DIVISIONS[division]}';
    final queryParameters =
        page != null ? <String, dynamic>{'page': page} : null;
    final response = await _get(url, queryParameters: queryParameters);

    return List<LeagueEntryDto>.from(
        response!.data.map((entryJson) => LeagueEntryDto.fromJson(entryJson)));
  }

  Future<LeagueListDto> getLeagueById(
      PlatformRoutingValue region, String leagueId) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/league/v4/leagues/$leagueId';
    final response = await _get(url);

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
    final response = await _get(url);

    return List<LeagueEntryDto>.from(
        response!.data.map((entryJson) => LeagueEntryDto.fromJson(entryJson)));
  }

  Future<LeagueListDto> _getApexLeagueByQueueAndApexRank(
      PlatformRoutingValue region,
      Queue selectedQueue,
      ApexRank apexRank) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/league/v4/${APEX_RANKS[apexRank]}leagues/by-queue/${QUEUES[selectedQueue]}';
    final response = await _get(url);

    return LeagueListDto.fromJson(response!.data);
  }

  Future<Response?>? _get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Response? response;
    try {
      response = await _client.get(url, queryParameters: queryParameters);
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
