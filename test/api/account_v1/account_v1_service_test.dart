import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:league_of_api/api/Consts/games.dart';
import 'package:league_of_api/api/Consts/region_routing_values.dart';
import 'package:league_of_api/api/account_v1/account_v1_service.dart';
import 'package:league_of_api/api/account_v1/models/account_dto.dart';
import 'package:league_of_api/api/account_v1/models/active_shard_dto.dart';
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
      final expectedPuuid = 'test';
      final expectedGameName = 'Driky';
      final expectedTagLine = TagLine('5441');
      final expected = AccountDto(
          puuid: expectedPuuid,
          gameName: expectedGameName,
          tagLine: expectedTagLine);
      final responsePayload = jsonEncode({
        'puuid': expectedPuuid,
        'gameName': expectedGameName,
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

    test('getAccountByPuuid return the expected AccountDto', () async {
      final expectedPuuid = 'test';
      final expectedGameName = 'Driky';
      final expectedTagLine = TagLine('5441');
      final expected = AccountDto(
          puuid: expectedPuuid,
          gameName: expectedGameName,
          tagLine: expectedTagLine);
      final responsePayload = jsonEncode({
        'puuid': expectedPuuid,
        'gameName': expectedGameName,
        'tagLine': '5441',
      });
      final httpResponse = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await service.getAccountByPuuid(
        RegionRoutingValue.AMERICAS,
        expectedPuuid,
      );

      expect(response == expected, equals(true));
    });

    test('getActiveShardForAPlayer return the expected ActiveShardDto',
        () async {
      final expectedPuuid = 'test';
      final expectedGame = 'lor';
      final expectedShard = 'na';

      final expected = ActiveShardDto(
        puuid: expectedPuuid,
        game: expectedGame,
        activeShard: expectedShard,
      );

      final responsePayload = jsonEncode({
        'puuid': expectedPuuid,
        'game': expectedGame,
        'activeShard': expectedShard,
      });

      final httpResponse = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await service.getActiveShardForAPlayer(
        RegionRoutingValue.AMERICAS,
        Game.LegendsOfRuneterra,
        expectedPuuid,
      );

      expect(response == expected, equals(true));
    });

    test('HTTP 400 throws', () async {
      final expectedGameName = 'Driky';
      final expectedTagLine = TagLine('5441');

      final responsePayload = jsonEncode({});
      final httpResponse = ResponseBody.fromString(
        responsePayload,
        400,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
      final riotId = RiotId(expectedGameName, expectedTagLine);

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      expect(
        () async => await service.getAccountByRiotId(
          RegionRoutingValue.AMERICAS,
          riotId,
        ),
        throwsA(
          isA<Exception>(),
        ),
      );
    });

    test('bad request throws', () async {
      final expectedGameName = 'Dr/i/ky';
      final expectedTagLine = TagLine('5441');

      final responsePayload = jsonEncode({});
      final httpResponse = ResponseBody.fromString(
        responsePayload,
        400,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
      final riotId = RiotId(expectedGameName, expectedTagLine);

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      expect(
        () async => await service.getAccountByRiotId(
          RegionRoutingValue.AMERICAS,
          riotId,
        ),
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });
}
