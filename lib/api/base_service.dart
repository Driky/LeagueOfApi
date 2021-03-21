import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'consts/error_status_codes.dart';

abstract class BaseService {
  final Dio _client;

  const BaseService(this._client);

  @protected
  Future<Response?>? get(
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
