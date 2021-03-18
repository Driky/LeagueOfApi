import 'package:dio/dio.dart';

class RiotTokenApiInjector implements Interceptor {
  final String _token;

  RiotTokenApiInjector(this._token);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Riot-Token'] = _token;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
