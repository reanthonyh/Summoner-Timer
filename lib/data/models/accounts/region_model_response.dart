import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model_response.g.dart';
part 'region_model_response.freezed.dart';

@freezed
abstract class RegionModelResponse with _$RegionModelResponse {
  const factory RegionModelResponse({String? puuid, String? game, String? region}) =
      _RegionModelResponse;

  factory RegionModelResponse.fromJson(Map<String, Object?> json) =>
      _$RegionModelResponseFromJson(json);
}
