import 'package:dio/dio.dart';
import 'package:league_of_api/api/Consts/error_status_code.dart';
import 'package:league_of_api/api/account_v1/models/account_dto.dart';
import 'package:league_of_api/api/models/riot_id.dart';

class AccountV1Service {
  final Dio _client;

  const AccountV1Service(this._client);

  Future<AccountDto> getAccountByRiotId(
    RiotId rid,
  ) async {
    final url =
        'https://americas.api.riotgames.com/riot/account/v1/accounts/by-riot-id/${rid.gameName}/${rid.tagLine}';
    return await _client.get(url).then((Response response) {
      if (ERROR_STATUS_CODES.keys.contains(response.statusCode)) {
        throw Exception(ERROR_STATUS_CODES[response.statusCode]);
      }

      return AccountDto.fromJson(response.data);
    });
  }
}
