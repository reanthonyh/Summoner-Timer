// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summoner_spells_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SummonerSpellsModelResponse {

 String? get type; String? get version; Map<String, SummonerSpellModel>? get data;
/// Create a copy of SummonerSpellsModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummonerSpellsModelResponseCopyWith<SummonerSpellsModelResponse> get copyWith => _$SummonerSpellsModelResponseCopyWithImpl<SummonerSpellsModelResponse>(this as SummonerSpellsModelResponse, _$identity);

  /// Serializes this SummonerSpellsModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummonerSpellsModelResponse&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,version,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SummonerSpellsModelResponse(type: $type, version: $version, data: $data)';
}


}

/// @nodoc
abstract mixin class $SummonerSpellsModelResponseCopyWith<$Res>  {
  factory $SummonerSpellsModelResponseCopyWith(SummonerSpellsModelResponse value, $Res Function(SummonerSpellsModelResponse) _then) = _$SummonerSpellsModelResponseCopyWithImpl;
@useResult
$Res call({
 String? type, String? version, Map<String, SummonerSpellModel>? data
});




}
/// @nodoc
class _$SummonerSpellsModelResponseCopyWithImpl<$Res>
    implements $SummonerSpellsModelResponseCopyWith<$Res> {
  _$SummonerSpellsModelResponseCopyWithImpl(this._self, this._then);

  final SummonerSpellsModelResponse _self;
  final $Res Function(SummonerSpellsModelResponse) _then;

/// Create a copy of SummonerSpellsModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? version = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, SummonerSpellModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SummonerSpellsModelResponse].
extension SummonerSpellsModelResponsePatterns on SummonerSpellsModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummonerSpellsModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummonerSpellsModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummonerSpellsModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _SummonerSpellsModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummonerSpellsModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SummonerSpellsModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? version,  Map<String, SummonerSpellModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummonerSpellsModelResponse() when $default != null:
return $default(_that.type,_that.version,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? version,  Map<String, SummonerSpellModel>? data)  $default,) {final _that = this;
switch (_that) {
case _SummonerSpellsModelResponse():
return $default(_that.type,_that.version,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? version,  Map<String, SummonerSpellModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _SummonerSpellsModelResponse() when $default != null:
return $default(_that.type,_that.version,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummonerSpellsModelResponse implements SummonerSpellsModelResponse {
  const _SummonerSpellsModelResponse({this.type, this.version, final  Map<String, SummonerSpellModel>? data}): _data = data;
  factory _SummonerSpellsModelResponse.fromJson(Map<String, dynamic> json) => _$SummonerSpellsModelResponseFromJson(json);

@override final  String? type;
@override final  String? version;
 final  Map<String, SummonerSpellModel>? _data;
@override Map<String, SummonerSpellModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SummonerSpellsModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummonerSpellsModelResponseCopyWith<_SummonerSpellsModelResponse> get copyWith => __$SummonerSpellsModelResponseCopyWithImpl<_SummonerSpellsModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummonerSpellsModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummonerSpellsModelResponse&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,version,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SummonerSpellsModelResponse(type: $type, version: $version, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SummonerSpellsModelResponseCopyWith<$Res> implements $SummonerSpellsModelResponseCopyWith<$Res> {
  factory _$SummonerSpellsModelResponseCopyWith(_SummonerSpellsModelResponse value, $Res Function(_SummonerSpellsModelResponse) _then) = __$SummonerSpellsModelResponseCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? version, Map<String, SummonerSpellModel>? data
});




}
/// @nodoc
class __$SummonerSpellsModelResponseCopyWithImpl<$Res>
    implements _$SummonerSpellsModelResponseCopyWith<$Res> {
  __$SummonerSpellsModelResponseCopyWithImpl(this._self, this._then);

  final _SummonerSpellsModelResponse _self;
  final $Res Function(_SummonerSpellsModelResponse) _then;

/// Create a copy of SummonerSpellsModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? version = freezed,Object? data = freezed,}) {
  return _then(_SummonerSpellsModelResponse(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, SummonerSpellModel>?,
  ));
}


}

// dart format on
