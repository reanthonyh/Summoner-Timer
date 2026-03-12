import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model_response.freezed.dart';
part 'account_model_response.g.dart';

@freezed
abstract class AccountModelResponse with _$AccountModelResponse {
  const factory AccountModelResponse({
    String? puuid,
    String? gameName,
    String? tagLine,
    int? profileIconId,
  }) = _AccountModelResponse;

  factory AccountModelResponse.fromJson(Map<String, Object?> json) =>
      _$AccountModelResponseFromJson(json);
}
