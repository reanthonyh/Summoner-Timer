// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summoner_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SummonerModelResponse {

 String? get puuid;@JsonKey(name: 'profileIconId') int? get profileIconId;@JsonKey(name: 'revisionDate') int? get revisionDate;@JsonKey(name: 'summonerLevel') int? get summonerLevel;
/// Create a copy of SummonerModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummonerModelResponseCopyWith<SummonerModelResponse> get copyWith => _$SummonerModelResponseCopyWithImpl<SummonerModelResponse>(this as SummonerModelResponse, _$identity);

  /// Serializes this SummonerModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummonerModelResponse&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.profileIconId, profileIconId) || other.profileIconId == profileIconId)&&(identical(other.revisionDate, revisionDate) || other.revisionDate == revisionDate)&&(identical(other.summonerLevel, summonerLevel) || other.summonerLevel == summonerLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,profileIconId,revisionDate,summonerLevel);

@override
String toString() {
  return 'SummonerModelResponse(puuid: $puuid, profileIconId: $profileIconId, revisionDate: $revisionDate, summonerLevel: $summonerLevel)';
}


}

/// @nodoc
abstract mixin class $SummonerModelResponseCopyWith<$Res>  {
  factory $SummonerModelResponseCopyWith(SummonerModelResponse value, $Res Function(SummonerModelResponse) _then) = _$SummonerModelResponseCopyWithImpl;
@useResult
$Res call({
 String? puuid,@JsonKey(name: 'profileIconId') int? profileIconId,@JsonKey(name: 'revisionDate') int? revisionDate,@JsonKey(name: 'summonerLevel') int? summonerLevel
});




}
/// @nodoc
class _$SummonerModelResponseCopyWithImpl<$Res>
    implements $SummonerModelResponseCopyWith<$Res> {
  _$SummonerModelResponseCopyWithImpl(this._self, this._then);

  final SummonerModelResponse _self;
  final $Res Function(SummonerModelResponse) _then;

/// Create a copy of SummonerModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? puuid = freezed,Object? profileIconId = freezed,Object? revisionDate = freezed,Object? summonerLevel = freezed,}) {
  return _then(_self.copyWith(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,profileIconId: freezed == profileIconId ? _self.profileIconId : profileIconId // ignore: cast_nullable_to_non_nullable
as int?,revisionDate: freezed == revisionDate ? _self.revisionDate : revisionDate // ignore: cast_nullable_to_non_nullable
as int?,summonerLevel: freezed == summonerLevel ? _self.summonerLevel : summonerLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SummonerModelResponse].
extension SummonerModelResponsePatterns on SummonerModelResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummonerModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummonerModelResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummonerModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _SummonerModelResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummonerModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SummonerModelResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? puuid, @JsonKey(name: 'profileIconId')  int? profileIconId, @JsonKey(name: 'revisionDate')  int? revisionDate, @JsonKey(name: 'summonerLevel')  int? summonerLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummonerModelResponse() when $default != null:
return $default(_that.puuid,_that.profileIconId,_that.revisionDate,_that.summonerLevel);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? puuid, @JsonKey(name: 'profileIconId')  int? profileIconId, @JsonKey(name: 'revisionDate')  int? revisionDate, @JsonKey(name: 'summonerLevel')  int? summonerLevel)  $default,) {final _that = this;
switch (_that) {
case _SummonerModelResponse():
return $default(_that.puuid,_that.profileIconId,_that.revisionDate,_that.summonerLevel);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? puuid, @JsonKey(name: 'profileIconId')  int? profileIconId, @JsonKey(name: 'revisionDate')  int? revisionDate, @JsonKey(name: 'summonerLevel')  int? summonerLevel)?  $default,) {final _that = this;
switch (_that) {
case _SummonerModelResponse() when $default != null:
return $default(_that.puuid,_that.profileIconId,_that.revisionDate,_that.summonerLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummonerModelResponse implements SummonerModelResponse {
  const _SummonerModelResponse({this.puuid, @JsonKey(name: 'profileIconId') this.profileIconId, @JsonKey(name: 'revisionDate') this.revisionDate, @JsonKey(name: 'summonerLevel') this.summonerLevel});
  factory _SummonerModelResponse.fromJson(Map<String, dynamic> json) => _$SummonerModelResponseFromJson(json);

@override final  String? puuid;
@override@JsonKey(name: 'profileIconId') final  int? profileIconId;
@override@JsonKey(name: 'revisionDate') final  int? revisionDate;
@override@JsonKey(name: 'summonerLevel') final  int? summonerLevel;

/// Create a copy of SummonerModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummonerModelResponseCopyWith<_SummonerModelResponse> get copyWith => __$SummonerModelResponseCopyWithImpl<_SummonerModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummonerModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummonerModelResponse&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.profileIconId, profileIconId) || other.profileIconId == profileIconId)&&(identical(other.revisionDate, revisionDate) || other.revisionDate == revisionDate)&&(identical(other.summonerLevel, summonerLevel) || other.summonerLevel == summonerLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,profileIconId,revisionDate,summonerLevel);

@override
String toString() {
  return 'SummonerModelResponse(puuid: $puuid, profileIconId: $profileIconId, revisionDate: $revisionDate, summonerLevel: $summonerLevel)';
}


}

/// @nodoc
abstract mixin class _$SummonerModelResponseCopyWith<$Res> implements $SummonerModelResponseCopyWith<$Res> {
  factory _$SummonerModelResponseCopyWith(_SummonerModelResponse value, $Res Function(_SummonerModelResponse) _then) = __$SummonerModelResponseCopyWithImpl;
@override @useResult
$Res call({
 String? puuid,@JsonKey(name: 'profileIconId') int? profileIconId,@JsonKey(name: 'revisionDate') int? revisionDate,@JsonKey(name: 'summonerLevel') int? summonerLevel
});




}
/// @nodoc
class __$SummonerModelResponseCopyWithImpl<$Res>
    implements _$SummonerModelResponseCopyWith<$Res> {
  __$SummonerModelResponseCopyWithImpl(this._self, this._then);

  final _SummonerModelResponse _self;
  final $Res Function(_SummonerModelResponse) _then;

/// Create a copy of SummonerModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? puuid = freezed,Object? profileIconId = freezed,Object? revisionDate = freezed,Object? summonerLevel = freezed,}) {
  return _then(_SummonerModelResponse(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,profileIconId: freezed == profileIconId ? _self.profileIconId : profileIconId // ignore: cast_nullable_to_non_nullable
as int?,revisionDate: freezed == revisionDate ? _self.revisionDate : revisionDate // ignore: cast_nullable_to_non_nullable
as int?,summonerLevel: freezed == summonerLevel ? _self.summonerLevel : summonerLevel // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
