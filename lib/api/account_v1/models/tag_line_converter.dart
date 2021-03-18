//import 'package:json_annotation/json_annotation.dart';
//import 'package:league_of_api/api/models/tag_line.dart';
//
//class TagLineConverter implements JsonConverter<TagLine, Map<String, dynamic>> {
//  const TagLineConverter();
//
//  @override
//  TagLine fromJson(Map<String, dynamic> json) {
//    return _TagLineFromJson(json);
//  }
//
//  @override
//  Map<String, dynamic> toJson(TagLine color) {
//    throw UnimplementedError(
//      'TagLine is read-only (generate Color.toJson if it\'s no longer the case)',
//    );
//  }
//
//  TagLine _TagLineFromJson(Map<String, dynamic> json) {
//    $checkKeys(json, requiredKeys: const ['tagLine']);
//    return TagLine(json['tagLine']);
//  }
//}
