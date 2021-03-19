import 'package:league_of_api/api/summoner_v4/models/mini_series_dto.dart';
import 'package:test/test.dart';

void main() {
  group('Constructor', () {
    test('Valid dto is created', () {
      var miniSeriesDTO = MiniSeriesDto(
        losses: 1,
        wins: 2,
        target: 3,
        progress: 'WLWNN',
      );
      expect(miniSeriesDTO, isA<MiniSeriesDto>());
    });
  });

  group('Factory', () {
    test('fromJoson return valid dto', () {
      var json = <String, dynamic>{
        'losses': 1,
        'wins': 2,
        'target': 3,
        'progress': 'WLWNN',
      };
      var miniSeriesDTO = MiniSeriesDto.fromJson(json);
      expect(miniSeriesDTO, isA<MiniSeriesDto>());
      expect(miniSeriesDTO.losses, equals(json['losses']));
      expect(miniSeriesDTO.progress, equals(json['progress']));
    });
  });
}
