// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) {
  return AccountDto(
    puuid: json['puuid'] as String,
    gameName: json['gameName'] as String,
    tagLine: AccountDto._tagLineFromJson(json['tagLine'] as String),
  );
}
