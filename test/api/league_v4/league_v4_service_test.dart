import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:league_of_api/api/consts/divisions.dart';
import 'package:league_of_api/api/consts/platform_routing_values.dart';
import 'package:league_of_api/api/consts/queue.dart';
import 'package:league_of_api/api/consts/tiers.dart';
import 'package:league_of_api/api/league_v4/league_v4_service.dart';
import 'package:league_of_api/api/league_v4/models/league_entry_dto.dart';
import 'package:league_of_api/api/league_v4/models/league_item_dto.dart';
import 'package:league_of_api/api/league_v4/models/league_list_dto.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'league_v4_service_test.mocks.dart';

@GenerateMocks([HttpClientAdapter])
void main() {
  final client = Dio();
  late MockHttpClientAdapter dioAdapterMock;
  late LeagueV4Service service;

  setUp(() {
    dioAdapterMock = MockHttpClientAdapter();
    client.httpClientAdapter = dioAdapterMock;
    service = LeagueV4Service(client);
  });

  group('Get methods', () {
    test('getMasterLeagueByQueue return the expected AccountDto', () async {
      final expectedLeagueItem1 = LeagueItemDto(
          freshBlood: true,
          wins: 83,
          summonerName: 'HAYES',
          inactive: false,
          veteran: false,
          hotStreak: false,
          rank: 'I',
          leaguePoints: 133,
          losses: 77,
          summonerId: '2wGhuT-rc9isBF5UpLRnyM3h7Rt1n7SX-xRvxaNl_bWV3sw');
      final expectedLeagueItem2 = LeagueItemDto(
          freshBlood: false,
          wins: 176,
          summonerName: 'Prymari',
          inactive: false,
          veteran: false,
          hotStreak: false,
          rank: 'I',
          leaguePoints: 132,
          losses: 171,
          summonerId: 'c9r9XLTM_afIvZ2_3YBwADOGAYZ9zYEPQK5JepUVqS4yCdg');
      final expected = LeagueListDto(
        leagueId: '1a3db499-99cb-32f0-b393-e1dd2e1467ea',
        tier: 'MASTER',
        name: 'Lulu\'s Battlemasters',
        queue: 'RANKED_SOLO_5x5',
        entries: <LeagueItemDto>[expectedLeagueItem1, expectedLeagueItem2],
      );

      final responsePayload = jsonEncode({
        'tier': expected.tier,
        'leagueId': expected.leagueId,
        'queue': expected.queue,
        'name': expected.name,
        'entries': [
          {
            'summonerId': expectedLeagueItem1.summonerId,
            'summonerName': expectedLeagueItem1.summonerName,
            'leaguePoints': expectedLeagueItem1.leaguePoints,
            'rank': expectedLeagueItem1.rank,
            'wins': expectedLeagueItem1.wins,
            'losses': expectedLeagueItem1.losses,
            'veteran': expectedLeagueItem1.veteran,
            'inactive': expectedLeagueItem1.inactive,
            'freshBlood': expectedLeagueItem1.freshBlood,
            'hotStreak': expectedLeagueItem1.hotStreak
          },
          {
            'summonerId': expectedLeagueItem2.summonerId,
            'summonerName': expectedLeagueItem2.summonerName,
            'leaguePoints': expectedLeagueItem2.leaguePoints,
            'rank': expectedLeagueItem2.rank,
            'wins': expectedLeagueItem2.wins,
            'losses': expectedLeagueItem2.losses,
            'veteran': expectedLeagueItem2.veteran,
            'inactive': expectedLeagueItem2.inactive,
            'freshBlood': expectedLeagueItem2.freshBlood,
            'hotStreak': expectedLeagueItem2.hotStreak
          }
        ]
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

      final response = await service.getMasterLeagueByQueue(
        PlatformRoutingValue.NA1,
        Queue.RANKED_SOLO_5x5,
      );

      expect(response == expected, equals(true));
    });

    test('getGrandmasterLeagueByQueue return the expected AccountDto',
        () async {
      final expectedLeagueItem1 = LeagueItemDto(
          freshBlood: true,
          wins: 280,
          summonerName: 'skylly',
          inactive: false,
          veteran: false,
          hotStreak: false,
          rank: 'I',
          leaguePoints: 202,
          losses: 235,
          summonerId: 'I-wvMQGyy5oOvLOa47c8Z8FnOIPQEu8DQ7c5LEvVCOkeZSI');
      final expectedLeagueItem2 = LeagueItemDto(
          freshBlood: false,
          wins: 122,
          summonerName: 'EGOSlinger',
          inactive: false,
          veteran: false,
          hotStreak: false,
          rank: 'I',
          leaguePoints: 246,
          losses: 112,
          summonerId: 'ReeYcwX080jOLmFMMAhjXUYAHgJMUbXGW5cQf6BRCH8V6LQ');
      final expected = LeagueListDto(
        leagueId: '21d8c492-38b0-3c21-89a6-d09342af7f2a',
        tier: 'GRANDMASTER',
        name: 'Ashe\'s Vindicators',
        queue: 'RANKED_SOLO_5x5',
        entries: <LeagueItemDto>[expectedLeagueItem1, expectedLeagueItem2],
      );

      final responsePayload = jsonEncode({
        'tier': expected.tier,
        'leagueId': expected.leagueId,
        'queue': expected.queue,
        'name': expected.name,
        'entries': [
          {
            'summonerId': expectedLeagueItem1.summonerId,
            'summonerName': expectedLeagueItem1.summonerName,
            'leaguePoints': expectedLeagueItem1.leaguePoints,
            'rank': expectedLeagueItem1.rank,
            'wins': expectedLeagueItem1.wins,
            'losses': expectedLeagueItem1.losses,
            'veteran': expectedLeagueItem1.veteran,
            'inactive': expectedLeagueItem1.inactive,
            'freshBlood': expectedLeagueItem1.freshBlood,
            'hotStreak': expectedLeagueItem1.hotStreak
          },
          {
            'summonerId': expectedLeagueItem2.summonerId,
            'summonerName': expectedLeagueItem2.summonerName,
            'leaguePoints': expectedLeagueItem2.leaguePoints,
            'rank': expectedLeagueItem2.rank,
            'wins': expectedLeagueItem2.wins,
            'losses': expectedLeagueItem2.losses,
            'veteran': expectedLeagueItem2.veteran,
            'inactive': expectedLeagueItem2.inactive,
            'freshBlood': expectedLeagueItem2.freshBlood,
            'hotStreak': expectedLeagueItem2.hotStreak
          }
        ]
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

      final response = await service.getGrandmasterLeagueByQueue(
        PlatformRoutingValue.NA1,
        Queue.RANKED_SOLO_5x5,
      );

      expect(response == expected, equals(true));
    });

    test('getChallengerLeagueByQueue return the expected AccountDto', () async {
      final expectedLeagueItem1 = LeagueItemDto(
          freshBlood: false,
          wins: 197,
          summonerName: 'Cody Sun',
          inactive: false,
          veteran: false,
          hotStreak: true,
          rank: 'I',
          leaguePoints: 771,
          losses: 176,
          summonerId: 'ZIzltRFq-1bsl7QeOgw3uMYVe-ycpLKJ7DljbXisrxWk');
      final expectedLeagueItem2 = LeagueItemDto(
          freshBlood: false,
          wins: 91,
          summonerName: 'TempoSpacer',
          inactive: false,
          veteran: false,
          hotStreak: false,
          rank: 'I',
          leaguePoints: 758,
          losses: 77,
          summonerId:
              'qqa-rxMaCrCadbddYlwMQGPHQVeteq7D4F2JF8d0hsgSl_3KjbJseqE24A');
      final expected = LeagueListDto(
        leagueId: '2bd81059-a0ce-33d4-9fb0-86977c851f64',
        tier: 'CHALLENGER',
        name: 'Alistar\'s Captains',
        queue: 'RANKED_SOLO_5x5',
        entries: <LeagueItemDto>[expectedLeagueItem1, expectedLeagueItem2],
      );

      final responsePayload = jsonEncode({
        'tier': expected.tier,
        'leagueId': expected.leagueId,
        'queue': expected.queue,
        'name': expected.name,
        'entries': [
          {
            'summonerId': expectedLeagueItem1.summonerId,
            'summonerName': expectedLeagueItem1.summonerName,
            'leaguePoints': expectedLeagueItem1.leaguePoints,
            'rank': expectedLeagueItem1.rank,
            'wins': expectedLeagueItem1.wins,
            'losses': expectedLeagueItem1.losses,
            'veteran': expectedLeagueItem1.veteran,
            'inactive': expectedLeagueItem1.inactive,
            'freshBlood': expectedLeagueItem1.freshBlood,
            'hotStreak': expectedLeagueItem1.hotStreak
          },
          {
            'summonerId': expectedLeagueItem2.summonerId,
            'summonerName': expectedLeagueItem2.summonerName,
            'leaguePoints': expectedLeagueItem2.leaguePoints,
            'rank': expectedLeagueItem2.rank,
            'wins': expectedLeagueItem2.wins,
            'losses': expectedLeagueItem2.losses,
            'veteran': expectedLeagueItem2.veteran,
            'inactive': expectedLeagueItem2.inactive,
            'freshBlood': expectedLeagueItem2.freshBlood,
            'hotStreak': expectedLeagueItem2.hotStreak
          }
        ]
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

      final response = await service.getChallengerLeagueByQueue(
        PlatformRoutingValue.NA1,
        Queue.RANKED_SOLO_5x5,
      );

      expect(response == expected, equals(true));
    });

    test('getLeagueById return the expected AccountDto', () async {
      final expectedLeagueItem1 = LeagueItemDto(
          freshBlood: false,
          wins: 197,
          summonerName: 'Cody Sun',
          inactive: false,
          veteran: false,
          hotStreak: true,
          rank: 'I',
          leaguePoints: 771,
          losses: 176,
          summonerId: 'ZIzltRFq-1bsl7QeOgw3uMYVe-ycpLKJ7DljbXisrxWk');
      final expectedLeagueItem2 = LeagueItemDto(
          freshBlood: false,
          wins: 91,
          summonerName: 'TempoSpacer',
          inactive: false,
          veteran: false,
          hotStreak: false,
          rank: 'I',
          leaguePoints: 758,
          losses: 77,
          summonerId:
              'qqa-rxMaCrCadbddYlwMQGPHQVeteq7D4F2JF8d0hsgSl_3KjbJseqE24A');
      final expected = LeagueListDto(
        leagueId: '2bd81059-a0ce-33d4-9fb0-86977c851f64',
        tier: 'CHALLENGER',
        name: 'Alistar\'s Captains',
        queue: 'RANKED_SOLO_5x5',
        entries: <LeagueItemDto>[expectedLeagueItem1, expectedLeagueItem2],
      );

      final responsePayload = jsonEncode({
        'tier': expected.tier,
        'leagueId': expected.leagueId,
        'queue': expected.queue,
        'name': expected.name,
        'entries': [
          {
            'summonerId': expectedLeagueItem1.summonerId,
            'summonerName': expectedLeagueItem1.summonerName,
            'leaguePoints': expectedLeagueItem1.leaguePoints,
            'rank': expectedLeagueItem1.rank,
            'wins': expectedLeagueItem1.wins,
            'losses': expectedLeagueItem1.losses,
            'veteran': expectedLeagueItem1.veteran,
            'inactive': expectedLeagueItem1.inactive,
            'freshBlood': expectedLeagueItem1.freshBlood,
            'hotStreak': expectedLeagueItem1.hotStreak
          },
          {
            'summonerId': expectedLeagueItem2.summonerId,
            'summonerName': expectedLeagueItem2.summonerName,
            'leaguePoints': expectedLeagueItem2.leaguePoints,
            'rank': expectedLeagueItem2.rank,
            'wins': expectedLeagueItem2.wins,
            'losses': expectedLeagueItem2.losses,
            'veteran': expectedLeagueItem2.veteran,
            'inactive': expectedLeagueItem2.inactive,
            'freshBlood': expectedLeagueItem2.freshBlood,
            'hotStreak': expectedLeagueItem2.hotStreak
          }
        ]
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

      final response = await service.getLeagueById(
        PlatformRoutingValue.NA1,
        '2bd81059-a0ce-33d4-9fb0-86977c851f64',
      );

      expect(response == expected, equals(true));
    });

    test(
        'getLeagueEntriesInAllQueuesBySummonerId return the expected AccountDto',
        () async {
      final expectedLeagueEntry1 = LeagueEntryDto(
          summonerName: 'DrykTheViking',
          inactive: false,
          freshBlood: false,
          veteran: false,
          hotStreak: false,
          losses: 37,
          wins: 40,
          leaguePoints: 33,
          rank: 'III',
          tier: 'SILVER',
          queueType: 'RANKED_SOLO_5x5',
          summonerId: 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
          leagueId: '12154ac3-5f4b-4f53-9242-60e5a66ea27c');
      final expectedLeagueEntry2 = LeagueEntryDto(
          summonerName: 'DrykTheViking',
          inactive: false,
          freshBlood: false,
          veteran: false,
          hotStreak: true,
          losses: 8,
          wins: 11,
          leaguePoints: 42,
          rank: 'II',
          tier: 'SILVER',
          queueType: 'RANKED_FLEX_SR',
          summonerId: 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
          leagueId: '91b06239-64e0-4b09-8de3-6fcd3cd47218');
      final expected = <LeagueEntryDto>[
        expectedLeagueEntry1,
        expectedLeagueEntry2
      ];

      final responsePayload = jsonEncode([
        {
          'leagueId': expectedLeagueEntry1.leagueId,
          'queueType': expectedLeagueEntry1.queueType,
          'tier': expectedLeagueEntry1.tier,
          'rank': expectedLeagueEntry1.rank,
          'summonerId': expectedLeagueEntry1.summonerId,
          'summonerName': expectedLeagueEntry1.summonerName,
          'leaguePoints': expectedLeagueEntry1.leaguePoints,
          'wins': expectedLeagueEntry1.wins,
          'losses': expectedLeagueEntry1.losses,
          'veteran': expectedLeagueEntry1.veteran,
          'inactive': expectedLeagueEntry1.inactive,
          'freshBlood': expectedLeagueEntry1.freshBlood,
          'hotStreak': expectedLeagueEntry1.hotStreak
        },
        {
          'leagueId': expectedLeagueEntry2.leagueId,
          'queueType': expectedLeagueEntry2.queueType,
          'tier': expectedLeagueEntry2.tier,
          'rank': expectedLeagueEntry2.rank,
          'summonerId': expectedLeagueEntry2.summonerId,
          'summonerName': expectedLeagueEntry2.summonerName,
          'leaguePoints': expectedLeagueEntry2.leaguePoints,
          'wins': expectedLeagueEntry2.wins,
          'losses': expectedLeagueEntry2.losses,
          'veteran': expectedLeagueEntry2.veteran,
          'inactive': expectedLeagueEntry2.inactive,
          'freshBlood': expectedLeagueEntry2.freshBlood,
          'hotStreak': expectedLeagueEntry2.hotStreak
        }
      ]);

      final httpResponse = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response = await service.getLeagueEntriesInAllQueuesBySummonerId(
        PlatformRoutingValue.NA1,
        'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
      );
      ;
      expect(ListEquality().equals(response, expected), equals(true));
    });

    test(
        'getAllLeagueEntriesByQueueAndTierAndDivision return the expected AccountDto',
        () async {
      final expectedLeagueEntry1 = LeagueEntryDto(
          summonerName: 'DrykTheViking',
          inactive: false,
          freshBlood: false,
          veteran: false,
          hotStreak: false,
          losses: 37,
          wins: 40,
          leaguePoints: 33,
          rank: 'III',
          tier: 'SILVER',
          queueType: 'RANKED_SOLO_5x5',
          summonerId: 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
          leagueId: '12154ac3-5f4b-4f53-9242-60e5a66ea27c');
      final expectedLeagueEntry2 = LeagueEntryDto(
          summonerName: 'DrykTheViking',
          inactive: false,
          freshBlood: false,
          veteran: false,
          hotStreak: true,
          losses: 8,
          wins: 11,
          leaguePoints: 42,
          rank: 'II',
          tier: 'SILVER',
          queueType: 'RANKED_FLEX_SR',
          summonerId: 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
          leagueId: '91b06239-64e0-4b09-8de3-6fcd3cd47218');
      final expected = <LeagueEntryDto>[
        expectedLeagueEntry1,
        expectedLeagueEntry2
      ];

      final responsePayload = jsonEncode([
        {
          'leagueId': expectedLeagueEntry1.leagueId,
          'queueType': expectedLeagueEntry1.queueType,
          'tier': expectedLeagueEntry1.tier,
          'rank': expectedLeagueEntry1.rank,
          'summonerId': expectedLeagueEntry1.summonerId,
          'summonerName': expectedLeagueEntry1.summonerName,
          'leaguePoints': expectedLeagueEntry1.leaguePoints,
          'wins': expectedLeagueEntry1.wins,
          'losses': expectedLeagueEntry1.losses,
          'veteran': expectedLeagueEntry1.veteran,
          'inactive': expectedLeagueEntry1.inactive,
          'freshBlood': expectedLeagueEntry1.freshBlood,
          'hotStreak': expectedLeagueEntry1.hotStreak
        },
        {
          'leagueId': expectedLeagueEntry2.leagueId,
          'queueType': expectedLeagueEntry2.queueType,
          'tier': expectedLeagueEntry2.tier,
          'rank': expectedLeagueEntry2.rank,
          'summonerId': expectedLeagueEntry2.summonerId,
          'summonerName': expectedLeagueEntry2.summonerName,
          'leaguePoints': expectedLeagueEntry2.leaguePoints,
          'wins': expectedLeagueEntry2.wins,
          'losses': expectedLeagueEntry2.losses,
          'veteran': expectedLeagueEntry2.veteran,
          'inactive': expectedLeagueEntry2.inactive,
          'freshBlood': expectedLeagueEntry2.freshBlood,
          'hotStreak': expectedLeagueEntry2.hotStreak
        }
      ]);

      final httpResponse = ResponseBody.fromString(
        responsePayload,
        200,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      final response =
          await service.getAllLeagueEntriesByQueueAndTierAndDivision(
        PlatformRoutingValue.NA1,
        Queue.RANKED_SOLO_5x5,
        Tier.DIAMOND,
        Division.I,
      );

      expect(ListEquality().equals(response, expected), equals(true));
    });
  });
}
