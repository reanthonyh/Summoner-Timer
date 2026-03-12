// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Account {

 String get puuid; String get gameName; String get tagLine; Region get region; int? get profileIconId;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.gameName, gameName) || other.gameName == gameName)&&(identical(other.tagLine, tagLine) || other.tagLine == tagLine)&&(identical(other.region, region) || other.region == region)&&(identical(other.profileIconId, profileIconId) || other.profileIconId == profileIconId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,gameName,tagLine,region,profileIconId);

@override
String toString() {
  return 'Account(puuid: $puuid, gameName: $gameName, tagLine: $tagLine, region: $region, profileIconId: $profileIconId)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 String puuid, String gameName, String tagLine, Region region, int? profileIconId
});




}
/// @nodoc
class _$AccountCopyWithImpl<$Res>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? puuid = null,Object? gameName = null,Object? tagLine = null,Object? region = null,Object? profileIconId = freezed,}) {
  return _then(_self.copyWith(
puuid: null == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String,gameName: null == gameName ? _self.gameName : gameName // ignore: cast_nullable_to_non_nullable
as String,tagLine: null == tagLine ? _self.tagLine : tagLine // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as Region,profileIconId: freezed == profileIconId ? _self.profileIconId : profileIconId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Account value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Account() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Account value)  $default,){
final _that = this;
switch (_that) {
case _Account():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Account value)?  $default,){
final _that = this;
switch (_that) {
case _Account() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String puuid,  String gameName,  String tagLine,  Region region,  int? profileIconId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.puuid,_that.gameName,_that.tagLine,_that.region,_that.profileIconId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String puuid,  String gameName,  String tagLine,  Region region,  int? profileIconId)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.puuid,_that.gameName,_that.tagLine,_that.region,_that.profileIconId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String puuid,  String gameName,  String tagLine,  Region region,  int? profileIconId)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.puuid,_that.gameName,_that.tagLine,_that.region,_that.profileIconId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Account implements Account {
  const _Account({required this.puuid, required this.gameName, required this.tagLine, required this.region, this.profileIconId});
  factory _Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

@override final  String puuid;
@override final  String gameName;
@override final  String tagLine;
@override final  Region region;
@override final  int? profileIconId;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.gameName, gameName) || other.gameName == gameName)&&(identical(other.tagLine, tagLine) || other.tagLine == tagLine)&&(identical(other.region, region) || other.region == region)&&(identical(other.profileIconId, profileIconId) || other.profileIconId == profileIconId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,puuid,gameName,tagLine,region,profileIconId);

@override
String toString() {
  return 'Account(puuid: $puuid, gameName: $gameName, tagLine: $tagLine, region: $region, profileIconId: $profileIconId)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 String puuid, String gameName, String tagLine, Region region, int? profileIconId
});




}
/// @nodoc
class __$AccountCopyWithImpl<$Res>
    implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? puuid = null,Object? gameName = null,Object? tagLine = null,Object? region = null,Object? profileIconId = freezed,}) {
  return _then(_Account(
puuid: null == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String,gameName: null == gameName ? _self.gameName : gameName // ignore: cast_nullable_to_non_nullable
as String,tagLine: null == tagLine ? _self.tagLine : tagLine // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as Region,profileIconId: freezed == profileIconId ? _self.profileIconId : profileIconId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
