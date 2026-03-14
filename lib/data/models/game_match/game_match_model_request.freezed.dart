// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_match_model_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameMatchModelRequest {

 String get puuid; RiotPlatform get platform;
/// Create a copy of GameMatchModelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameMatchModelRequestCopyWith<GameMatchModelRequest> get copyWith => _$GameMatchModelRequestCopyWithImpl<GameMatchModelRequest>(this as GameMatchModelRequest, _$identity);

  /// Serializes this GameMatchModelRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameMatchModelRequest&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.platform, platform) || other.platform == platform));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,platform);

@override
String toString() {
  return 'GameMatchModelRequest(puuid: $puuid, platform: $platform)';
}


}

/// @nodoc
abstract mixin class $GameMatchModelRequestCopyWith<$Res>  {
  factory $GameMatchModelRequestCopyWith(GameMatchModelRequest value, $Res Function(GameMatchModelRequest) _then) = _$GameMatchModelRequestCopyWithImpl;
@useResult
$Res call({
 String puuid, RiotPlatform platform
});




}
/// @nodoc
class _$GameMatchModelRequestCopyWithImpl<$Res>
    implements $GameMatchModelRequestCopyWith<$Res> {
  _$GameMatchModelRequestCopyWithImpl(this._self, this._then);

  final GameMatchModelRequest _self;
  final $Res Function(GameMatchModelRequest) _then;

/// Create a copy of GameMatchModelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? puuid = null,Object? platform = null,}) {
  return _then(_self.copyWith(
puuid: null == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as RiotPlatform,
  ));
}

}


/// Adds pattern-matching-related methods to [GameMatchModelRequest].
extension GameMatchModelRequestPatterns on GameMatchModelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameMatchModelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameMatchModelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameMatchModelRequest value)  $default,){
final _that = this;
switch (_that) {
case _GameMatchModelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameMatchModelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GameMatchModelRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String puuid,  RiotPlatform platform)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameMatchModelRequest() when $default != null:
return $default(_that.puuid,_that.platform);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String puuid,  RiotPlatform platform)  $default,) {final _that = this;
switch (_that) {
case _GameMatchModelRequest():
return $default(_that.puuid,_that.platform);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String puuid,  RiotPlatform platform)?  $default,) {final _that = this;
switch (_that) {
case _GameMatchModelRequest() when $default != null:
return $default(_that.puuid,_that.platform);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameMatchModelRequest implements GameMatchModelRequest {
  const _GameMatchModelRequest({required this.puuid, required this.platform});
  factory _GameMatchModelRequest.fromJson(Map<String, dynamic> json) => _$GameMatchModelRequestFromJson(json);

@override final  String puuid;
@override final  RiotPlatform platform;

/// Create a copy of GameMatchModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameMatchModelRequestCopyWith<_GameMatchModelRequest> get copyWith => __$GameMatchModelRequestCopyWithImpl<_GameMatchModelRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameMatchModelRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameMatchModelRequest&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.platform, platform) || other.platform == platform));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,platform);

@override
String toString() {
  return 'GameMatchModelRequest(puuid: $puuid, platform: $platform)';
}


}

/// @nodoc
abstract mixin class _$GameMatchModelRequestCopyWith<$Res> implements $GameMatchModelRequestCopyWith<$Res> {
  factory _$GameMatchModelRequestCopyWith(_GameMatchModelRequest value, $Res Function(_GameMatchModelRequest) _then) = __$GameMatchModelRequestCopyWithImpl;
@override @useResult
$Res call({
 String puuid, RiotPlatform platform
});




}
/// @nodoc
class __$GameMatchModelRequestCopyWithImpl<$Res>
    implements _$GameMatchModelRequestCopyWith<$Res> {
  __$GameMatchModelRequestCopyWithImpl(this._self, this._then);

  final _GameMatchModelRequest _self;
  final $Res Function(_GameMatchModelRequest) _then;

/// Create a copy of GameMatchModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? puuid = null,Object? platform = null,}) {
  return _then(_GameMatchModelRequest(
puuid: null == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as RiotPlatform,
  ));
}


}

// dart format on
