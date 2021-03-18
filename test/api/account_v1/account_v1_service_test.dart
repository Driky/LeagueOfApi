import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:league_of_api/api/Consts/region_routing_values.dart';
import 'package:league_of_api/api/account_v1/account_v1_service.dart';
import 'package:league_of_api/api/account_v1/models/account_dto.dart';
import 'package:league_of_api/api/models/riot_id.dart';
import 'package:league_of_api/api/models/tag_line.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'account_v1_service_test.mocks.dart';

@GenerateMocks([HttpClientAdapter])
void main() {
  final client = Dio();
  late MockHttpClientAdapter dioAdapterMock;
  late AccountV1Service service;

  setUp(() {
    dioAdapterMock = MockHttpClientAdapter();
    client.httpClientAdapter = dioAdapterMock;
    service = AccountV1Service(client);
  });

  group('Get methods', () {
    test('getAccountByRiotId return the expected AccountDto', () async {
      final expectedTagLine = TagLine('5441');
      final expected = AccountDto(
          puuid: 'test', gameName: 'Driky', tagLine: expectedTagLine);
      final responsePayload = jsonEncode({
        'puuid': 'test',
        'gameName': 'Driky',
        'tagLine': '5441',
      });
      final httpResponse = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
      final riotId = RiotId('Driky', expectedTagLine);

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await service.getAccountByRiotId(
        RegionRoutingValue.AMERICAS,
        riotId,
      );

      expect(response == expected, equals(true));
    });
  });
}
