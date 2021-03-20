import 'package:dio/dio.dart';
import 'package:league_of_api/api/consts/error_status_codes.dart';
import 'package:league_of_api/api/consts/platform_routing_values.dart';
import 'package:league_of_api/api/consts/queue.dart';
import 'package:league_of_api/api/league_v4/models/league_entry_dto.dart';
import 'package:league_of_api/api/league_v4/models/league_list_dto.dart';

class LeagueV4Service {
  final Dio _client;

  const LeagueV4Service(this._client);

  Future<LeagueListDto> getChallengerLeagueByQueue(
    PlatformRoutingValue region,
    Queue selectedQueue,
  ) async {
    final url =
        'https://${PLATFORM_ROUTING_VALUES[region]}/lol/league/v4/challengerleagues/by-queue/${QUEUES[selectedQueue]}';
    final response = await _get(url);

    return LeagueListDto.fromJson(response!.data);
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
