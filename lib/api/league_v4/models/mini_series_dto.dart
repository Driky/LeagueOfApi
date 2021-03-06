import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mini_series_dto.g.dart';

@JsonSerializable(createToJson: false)
class MiniSeriesDto extends Equatable {
  final String progress;
  final int wins;
  final int losses;
  final int target;

  MiniSeriesDto({
    required this.progress,
    required this.wins,
    required this.losses,
    required this.target,
  });

  factory MiniSeriesDto.fromJson(Map<String, dynamic> json) =>
      _$MiniSeriesDtoFromJson(json);

  @override
  List<Object?> get props => [progress, wins, losses, target];

  @override
  bool get stringify => true;
}

class MiniSeriesDtoConverter
    implements JsonConverter<MiniSeriesDto, Map<String, dynamic>> {
  const MiniSeriesDtoConverter();
  @override
  MiniSeriesDto fromJson(Map<String, dynamic> json) {
    return MiniSeriesDto.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(MiniSeriesDto object) {
    throw UnimplementedError(
        'MiniSeriesDto is read-only (generate MiniSeriesDto.toJson if it\'s no longer the case)');
  }
}
