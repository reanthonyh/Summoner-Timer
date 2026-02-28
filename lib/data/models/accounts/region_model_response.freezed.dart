// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegionModelResponse {

 String? get puuid; String? get game; String? get region;
/// Create a copy of RegionModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegionModelResponseCopyWith<RegionModelResponse> get copyWith => _$RegionModelResponseCopyWithImpl<RegionModelResponse>(this as RegionModelResponse, _$identity);

  /// Serializes this RegionModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegionModelResponse&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.game, game) || other.game == game)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,game,region);

@override
String toString() {
  return 'RegionModelResponse(puuid: $puuid, game: $game, region: $region)';
}


}

/// @nodoc
abstract mixin class $RegionModelResponseCopyWith<$Res>  {
  factory $RegionModelResponseCopyWith(RegionModelResponse value, $Res Function(RegionModelResponse) _then) = _$RegionModelResponseCopyWithImpl;
@useResult
$Res call({
 String? puuid, String? game, String? region
});




}
/// @nodoc
class _$RegionModelResponseCopyWithImpl<$Res>
    implements $RegionModelResponseCopyWith<$Res> {
  _$RegionModelResponseCopyWithImpl(this._self, this._then);

  final RegionModelResponse _self;
  final $Res Function(RegionModelResponse) _then;

/// Create a copy of RegionModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? puuid = freezed,Object? game = freezed,Object? region = freezed,}) {
  return _then(_self.copyWith(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,game: freezed == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegionModelResponse].
extension RegionModelResponsePatterns on RegionModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegionModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegionModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegionModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _RegionModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegionModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RegionModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? puuid,  String? game,  String? region)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegionModelResponse() when $default != null:
return $default(_that.puuid,_that.game,_that.region);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? puuid,  String? game,  String? region)  $default,) {final _that = this;
switch (_that) {
case _RegionModelResponse():
return $default(_that.puuid,_that.game,_that.region);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? puuid,  String? game,  String? region)?  $default,) {final _that = this;
switch (_that) {
case _RegionModelResponse() when $default != null:
return $default(_that.puuid,_that.game,_that.region);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegionModelResponse implements RegionModelResponse {
  const _RegionModelResponse({this.puuid, this.game, this.region});
  factory _RegionModelResponse.fromJson(Map<String, dynamic> json) => _$RegionModelResponseFromJson(json);

@override final  String? puuid;
@override final  String? game;
@override final  String? region;

/// Create a copy of RegionModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegionModelResponseCopyWith<_RegionModelResponse> get copyWith => __$RegionModelResponseCopyWithImpl<_RegionModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegionModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegionModelResponse&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.game, game) || other.game == game)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,game,region);

@override
String toString() {
  return 'RegionModelResponse(puuid: $puuid, game: $game, region: $region)';
}


}

/// @nodoc
abstract mixin class _$RegionModelResponseCopyWith<$Res> implements $RegionModelResponseCopyWith<$Res> {
  factory _$RegionModelResponseCopyWith(_RegionModelResponse value, $Res Function(_RegionModelResponse) _then) = __$RegionModelResponseCopyWithImpl;
@override @useResult
$Res call({
 String? puuid, String? game, String? region
});




}
/// @nodoc
class __$RegionModelResponseCopyWithImpl<$Res>
    implements _$RegionModelResponseCopyWith<$Res> {
  __$RegionModelResponseCopyWithImpl(this._self, this._then);

  final _RegionModelResponse _self;
  final $Res Function(_RegionModelResponse) _then;

/// Create a copy of RegionModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? puuid = freezed,Object? game = freezed,Object? region = freezed,}) {
  return _then(_RegionModelResponse(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,game: freezed == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
