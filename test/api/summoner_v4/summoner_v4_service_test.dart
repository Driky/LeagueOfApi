import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:league_of_api/api/consts/platform_routing_values.dart';
import 'package:league_of_api/api/summoner_v4/models/summoner_dto.dart';
import 'package:league_of_api/api/summoner_v4/summoner_v4_service.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../account_v1/account_v1_service_test.mocks.dart';

void main() {
  final client = Dio();
  late MockHttpClientAdapter dioAdapterMock;
  late SummonerV4Service service;

  final summonerDto = SummonerDto(
    accountId: 'hEbw_NrnHM5sttr1sXEUyHfgRwDOsleNkU_00U7CKAI1atI',
    id: 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
    puuid:
        'lIQ0bUHcMziDaMWPRoYNkOSncdpF_a8-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
    name: 'DrykTheViking',
    profileIconId: 4777,
    revisionDate: 1615949557000,
    summonerLevel: 179,
  );

  setUp(() {
    dioAdapterMock = MockHttpClientAdapter();
    client.httpClientAdapter = dioAdapterMock;
    service = SummonerV4Service(client);
  });

  group('Get methods', () {
    test('getSummonerBySummonerName return the expected SummonerDto', () async {
      final responsePayload = jsonEncode({
        'id': 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
        'accountId': 'hEbw_NrnHM5sttr1sXEUyHfgRwDOsleNkU_00U7CKAI1atI',
        'puuid':
            'lIQ0bUHcMziDaMWPRoYNkOSncdpF_a8-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
        'name': 'DrykTheViking',
        'profileIconId': 4777,
        'revisionDate': 1615949557000,
        'summonerLevel': 179
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

      final response = await service.getSummonerBySummonerName(
        PlatformRoutingValue.NA1,
        summonerDto.name,
      );

      expect(response == summonerDto, equals(true));
    });

    test('getSummonerByAccountId return the expected SummonerDto', () async {
      final responsePayload = jsonEncode({
        'id': 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
        'accountId': 'hEbw_NrnHM5sttr1sXEUyHfgRwDOsleNkU_00U7CKAI1atI',
        'puuid':
            'lIQ0bUHcMziDaMWPRoYNkOSncdpF_a8-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
        'name': 'DrykTheViking',
        'profileIconId': 4777,
        'revisionDate': 1615949557000,
        'summonerLevel': 179
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

      final response = await service.getSummonerByAccountId(
        PlatformRoutingValue.NA1,
        summonerDto.accountId,
      );

      expect(response == summonerDto, equals(true));
    });

    test('getSummonerByPuuid return the expected SummonerDto', () async {
      final responsePayload = jsonEncode({
        'id': 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
        'accountId': 'hEbw_NrnHM5sttr1sXEUyHfgRwDOsleNkU_00U7CKAI1atI',
        'puuid':
            'lIQ0bUHcMziDaMWPRoYNkOSncdpF_a8-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
        'name': 'DrykTheViking',
        'profileIconId': 4777,
        'revisionDate': 1615949557000,
        'summonerLevel': 179
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

      final response = await service.getSummonerByPuuid(
        PlatformRoutingValue.NA1,
        summonerDto.puuid,
      );

      expect(response == summonerDto, equals(true));
    });

    test('getSummonerBySummonerId return the expected SummonerDto', () async {
      final responsePayload = jsonEncode({
        'id': 'SD7xREhKZKKZ5vC5aKJf6w6FcOA9HpY4QDEHL4KyzQIha7U',
        'accountId': 'hEbw_NrnHM5sttr1sXEUyHfgRwDOsleNkU_00U7CKAI1atI',
        'puuid':
            'lIQ0bUHcMziDaMWPRoYNkOSncdpF_a8-QpPHBQFIU5oPBWGQpVcpM7ijXU75l-0Hd4LAj0HOV7un_w',
        'name': 'DrykTheViking',
        'profileIconId': 4777,
        'revisionDate': 1615949557000,
        'summonerLevel': 179
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

      final response = await service.getSummonerBySummonerId(
        PlatformRoutingValue.NA1,
        summonerDto.id,
      );

      expect(response == summonerDto, equals(true));
    });
  });
}
