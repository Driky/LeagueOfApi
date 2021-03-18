import 'package:dio/dio.dart';

class LeagueOfApi {
  late Dio _client;
  static const int _CONNECT_TIMEOUT = 5000;
  static const int _RECEIVE_TIMEOUT = 3000;
  static const int _SEND_TIMEOUT = 3000;

  LeagueOfApi({Dio? client, bool log = false}) {
    if (client != null) {
      _client = client;
    } else {
      _client = Dio(BaseOptions(
        connectTimeout: _CONNECT_TIMEOUT,
        receiveTimeout: _RECEIVE_TIMEOUT,
        sendTimeout: _SEND_TIMEOUT,
      ));
      if (log) {
        //fixme: uncomment when PrettyDioLogger become compatible with dio v4
//        _client.interceptors.add(PrettyDioLogger(
//            requestHeader: true,
//            requestBody: true,
//            responseBody: true,
//            responseHeader: false,
//            error: true,
//            compact: true,
//            maxWidth: 90));
      }
    }
  }
}
