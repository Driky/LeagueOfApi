import 'package:dio/dio.dart';
import 'package:league_of_api/api/account_v1/account_v1_service.dart';
import 'package:league_of_api/api/league_v4/league_v4_service.dart';
import 'package:league_of_api/api/summoner_v4/summoner_v4_service.dart';
import 'package:league_of_api/src/riot_token_api_injector.dart';

class LeagueOfApi {
  late final Dio _client;
  final String _apiKey;
  late final AccountV1Service accountV1Service;
  late final SummonerV4Service summonerService;
  late final LeagueV4Service leagueService;

  static const int _CONNECT_TIMEOUT = 5000;
  static const int _RECEIVE_TIMEOUT = 3000;
  static const int _SEND_TIMEOUT = 3000;

  LeagueOfApi(this._apiKey, {Dio? client, bool log = false}) {
    if (client != null) {
      _client = client;
    } else {
      _client = Dio(BaseOptions(
        connectTimeout: _CONNECT_TIMEOUT,
        receiveTimeout: _RECEIVE_TIMEOUT,
        sendTimeout: _SEND_TIMEOUT,
      ));

      _client.interceptors.add(RiotTokenApiInjector(_apiKey));

// fixme: uncomment when PrettyDioLogger become compatible with dio v4
//      if (log) {
//        _client.interceptors.add(PrettyDioLogger(
//            requestHeader: true,
//            requestBody: true,
//            responseBody: true,
//            responseHeader: false,
//            error: true,
//            compact: true,
//            maxWidth: 90));
//      }

      accountV1Service = AccountV1Service(_client);
      summonerService = SummonerV4Service(_client);
      leagueService = LeagueV4Service(_client);
    }
  }
}
