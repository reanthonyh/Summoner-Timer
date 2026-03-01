import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_model.g.dart';
part 'participant_model.freezed.dart';

@freezed
abstract class ParticipantModel with _$ParticipantModel {
  const factory ParticipantModel({
    String? puuid,
    int? teamId,
    int? spell1Id,
    int? spell2Id,
    String? riotId,
    int? championId,
    int? profileIconId,
  }) = _ParticipantModel;

  factory ParticipantModel.fromJson(Map<String, Object?> json) =>
      _$ParticipantModelFromJson(json);
}
