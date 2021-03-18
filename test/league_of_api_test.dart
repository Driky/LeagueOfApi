// @dart=2.9
import 'package:dio/dio.dart';
import 'package:league_of_api/league_of_api.dart';
import 'package:test/test.dart';

void main() {
  group('Init client', () {
    LeagueOfApi client;

    setUp(() {
      client = LeagueOfApi(log: true);
    });

    test('Client is initialized', () {
      expect(client, isA<LeagueOfApi>());
    });

    test('Client is initialized with given dio instance', () {
      var dio = Dio();
      client = LeagueOfApi(client: dio);

      expect(client, isA<LeagueOfApi>());
    });
  });
}
