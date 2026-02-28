import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model_request.freezed.dart';
part 'account_model_request.g.dart';

@freezed
abstract class AccountModelRequest with _$AccountModelRequest {
  const factory AccountModelRequest({
    required String name,
    required String tag,
  }) = _AccountModelRequest;

  factory AccountModelRequest.fromJson(Map<String, Object?> json) =>
      _$AccountModelRequestFromJson(json);
}
