import 'package:dio/dio.dart';
import 'package:league_of_api/league_of_api.dart';
import 'package:test/test.dart';

void main() {
  group('Init client', () {
    late LeagueOfApi client;

    setUp(() {
      client = LeagueOfApi('someapikey', log: true);
    });

    test('Client is initialized', () {
      expect(client, isA<LeagueOfApi>());
    });

    test('Client is initialized with given dio instance', () {
      var dio = Dio();
      client = LeagueOfApi('someapikey', client: dio);

      expect(client, isA<LeagueOfApi>());
    });
  });
}
