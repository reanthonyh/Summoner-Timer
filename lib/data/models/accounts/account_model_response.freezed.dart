// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountModelResponse {

 String? get puuid; String? get gameName; String? get tagLine;
/// Create a copy of AccountModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountModelResponseCopyWith<AccountModelResponse> get copyWith => _$AccountModelResponseCopyWithImpl<AccountModelResponse>(this as AccountModelResponse, _$identity);

  /// Serializes this AccountModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountModelResponse&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.gameName, gameName) || other.gameName == gameName)&&(identical(other.tagLine, tagLine) || other.tagLine == tagLine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,gameName,tagLine);

@override
String toString() {
  return 'AccountModelResponse(puuid: $puuid, gameName: $gameName, tagLine: $tagLine)';
}


}

/// @nodoc
abstract mixin class $AccountModelResponseCopyWith<$Res>  {
  factory $AccountModelResponseCopyWith(AccountModelResponse value, $Res Function(AccountModelResponse) _then) = _$AccountModelResponseCopyWithImpl;
@useResult
$Res call({
 String? puuid, String? gameName, String? tagLine
});




}
/// @nodoc
class _$AccountModelResponseCopyWithImpl<$Res>
    implements $AccountModelResponseCopyWith<$Res> {
  _$AccountModelResponseCopyWithImpl(this._self, this._then);

  final AccountModelResponse _self;
  final $Res Function(AccountModelResponse) _then;

/// Create a copy of AccountModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? puuid = freezed,Object? gameName = freezed,Object? tagLine = freezed,}) {
  return _then(_self.copyWith(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,gameName: freezed == gameName ? _self.gameName : gameName // ignore: cast_nullable_to_non_nullable
as String?,tagLine: freezed == tagLine ? _self.tagLine : tagLine // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountModelResponse].
extension AccountModelResponsePatterns on AccountModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _AccountModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AccountModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? puuid,  String? gameName,  String? tagLine)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountModelResponse() when $default != null:
return $default(_that.puuid,_that.gameName,_that.tagLine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? puuid,  String? gameName,  String? tagLine)  $default,) {final _that = this;
switch (_that) {
case _AccountModelResponse():
return $default(_that.puuid,_that.gameName,_that.tagLine);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? puuid,  String? gameName,  String? tagLine)?  $default,) {final _that = this;
switch (_that) {
case _AccountModelResponse() when $default != null:
return $default(_that.puuid,_that.gameName,_that.tagLine);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountModelResponse implements AccountModelResponse {
  const _AccountModelResponse({this.puuid, this.gameName, this.tagLine});
  factory _AccountModelResponse.fromJson(Map<String, dynamic> json) => _$AccountModelResponseFromJson(json);

@override final  String? puuid;
@override final  String? gameName;
@override final  String? tagLine;

/// Create a copy of AccountModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountModelResponseCopyWith<_AccountModelResponse> get copyWith => __$AccountModelResponseCopyWithImpl<_AccountModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountModelResponse&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.gameName, gameName) || other.gameName == gameName)&&(identical(other.tagLine, tagLine) || other.tagLine == tagLine));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,gameName,tagLine);

@override
String toString() {
  return 'AccountModelResponse(puuid: $puuid, gameName: $gameName, tagLine: $tagLine)';
}


}

/// @nodoc
abstract mixin class _$AccountModelResponseCopyWith<$Res> implements $AccountModelResponseCopyWith<$Res> {
  factory _$AccountModelResponseCopyWith(_AccountModelResponse value, $Res Function(_AccountModelResponse) _then) = __$AccountModelResponseCopyWithImpl;
@override @useResult
$Res call({
 String? puuid, String? gameName, String? tagLine
});




}
/// @nodoc
class __$AccountModelResponseCopyWithImpl<$Res>
    implements _$AccountModelResponseCopyWith<$Res> {
  __$AccountModelResponseCopyWithImpl(this._self, this._then);

  final _AccountModelResponse _self;
  final $Res Function(_AccountModelResponse) _then;

/// Create a copy of AccountModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? puuid = freezed,Object? gameName = freezed,Object? tagLine = freezed,}) {
  return _then(_AccountModelResponse(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,gameName: freezed == gameName ? _self.gameName : gameName // ignore: cast_nullable_to_non_nullable
as String?,tagLine: freezed == tagLine ? _self.tagLine : tagLine // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
