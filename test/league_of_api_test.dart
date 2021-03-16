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
  });
}
