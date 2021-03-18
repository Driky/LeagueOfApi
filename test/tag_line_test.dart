import 'package:league_of_api/api/models/tag_line.dart';
import 'package:test/test.dart';

void main() {
  group('Constructor', () {
    test('Valid tagline is created', () {
      var tagline = TagLine('1234');
      expect(tagline, isA<TagLine>());
    });

    test('invalid tagline throw an exception', () {
      expect(
        () => TagLine('123456'),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });

  group('Methods', () {
    test('toString return the tagLine', () {
      var expected = '1234';
      var tagline = TagLine(expected);
      expect(tagline.toString(), equals(expected));
    });
  });
}
