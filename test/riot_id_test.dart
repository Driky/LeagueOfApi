import 'package:league_of_api/api/models/riot_id.dart';
import 'package:league_of_api/api/models/tag_line.dart';
import 'package:test/test.dart';

void main() {
  group('Constructor', () {
    test('Valid RiotId is created', () {
      var riotId = RiotId('RandomName', TagLine('1234'));
      expect(riotId, isA<RiotId>());
    });

    test('Invalid RiotId throw an exception', () {
      expect(
        () => RiotId('RandomName', TagLine('12345')),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });

  group('Constructor', () {
    test('Getter return expected values', () {
      var expectedName = 'RandomName';
      var expectedTag = '1234';

      var riotId = RiotId(expectedName, TagLine(expectedTag));
      expect(riotId.gameName, equals(expectedName));
      expect(riotId.tagLine, equals(expectedTag));
    });
  });
}
