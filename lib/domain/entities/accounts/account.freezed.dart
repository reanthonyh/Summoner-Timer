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

 String get puuid; int get level; String get gameName; String get tagLine; Region get region; String get iconUrl;
/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCopyWith<Account> get copyWith => _$AccountCopyWithImpl<Account>(this as Account, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Account&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.level, level) || other.level == level)&&(identical(other.gameName, gameName) || other.gameName == gameName)&&(identical(other.tagLine, tagLine) || other.tagLine == tagLine)&&(identical(other.region, region) || other.region == region)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}


@override
int get hashCode => Object.hash(runtimeType,puuid,level,gameName,tagLine,region,iconUrl);

@override
String toString() {
  return 'Account(puuid: $puuid, level: $level, gameName: $gameName, tagLine: $tagLine, region: $region, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res>  {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) = _$AccountCopyWithImpl;
@useResult
$Res call({
 String puuid, int level, String gameName, String tagLine, Region region, String iconUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? puuid = null,Object? level = null,Object? gameName = null,Object? tagLine = null,Object? region = null,Object? iconUrl = null,}) {
  return _then(_self.copyWith(
puuid: null == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,gameName: null == gameName ? _self.gameName : gameName // ignore: cast_nullable_to_non_nullable
as String,tagLine: null == tagLine ? _self.tagLine : tagLine // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as Region,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String puuid,  int level,  String gameName,  String tagLine,  Region region,  String iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.puuid,_that.level,_that.gameName,_that.tagLine,_that.region,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String puuid,  int level,  String gameName,  String tagLine,  Region region,  String iconUrl)  $default,) {final _that = this;
switch (_that) {
case _Account():
return $default(_that.puuid,_that.level,_that.gameName,_that.tagLine,_that.region,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String puuid,  int level,  String gameName,  String tagLine,  Region region,  String iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _Account() when $default != null:
return $default(_that.puuid,_that.level,_that.gameName,_that.tagLine,_that.region,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Account implements Account {
  const _Account({required this.puuid, required this.level, required this.gameName, required this.tagLine, required this.region, required this.iconUrl});
  

@override final  String puuid;
@override final  int level;
@override final  String gameName;
@override final  String tagLine;
@override final  Region region;
@override final  String iconUrl;

/// Create a copy of Account
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCopyWith<_Account> get copyWith => __$AccountCopyWithImpl<_Account>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Account&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.level, level) || other.level == level)&&(identical(other.gameName, gameName) || other.gameName == gameName)&&(identical(other.tagLine, tagLine) || other.tagLine == tagLine)&&(identical(other.region, region) || other.region == region)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}


@override
int get hashCode => Object.hash(runtimeType,puuid,level,gameName,tagLine,region,iconUrl);

@override
String toString() {
  return 'Account(puuid: $puuid, level: $level, gameName: $gameName, tagLine: $tagLine, region: $region, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) = __$AccountCopyWithImpl;
@override @useResult
$Res call({
 String puuid, int level, String gameName, String tagLine, Region region, String iconUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? puuid = null,Object? level = null,Object? gameName = null,Object? tagLine = null,Object? region = null,Object? iconUrl = null,}) {
  return _then(_Account(
puuid: null == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,gameName: null == gameName ? _self.gameName : gameName // ignore: cast_nullable_to_non_nullable
as String,tagLine: null == tagLine ? _self.tagLine : tagLine // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as Region,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
