// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summoner_spell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SummonerSpell {

 String get id; String get name; int get cooldownSeconds; String get spriteUrl; String get imageUrl;
/// Create a copy of SummonerSpell
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummonerSpellCopyWith<SummonerSpell> get copyWith => _$SummonerSpellCopyWithImpl<SummonerSpell>(this as SummonerSpell, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummonerSpell&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds)&&(identical(other.spriteUrl, spriteUrl) || other.spriteUrl == spriteUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,cooldownSeconds,spriteUrl,imageUrl);

@override
String toString() {
  return 'SummonerSpell(id: $id, name: $name, cooldownSeconds: $cooldownSeconds, spriteUrl: $spriteUrl, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $SummonerSpellCopyWith<$Res>  {
  factory $SummonerSpellCopyWith(SummonerSpell value, $Res Function(SummonerSpell) _then) = _$SummonerSpellCopyWithImpl;
@useResult
$Res call({
 String id, String name, int cooldownSeconds, String spriteUrl, String imageUrl
});




}
/// @nodoc
class _$SummonerSpellCopyWithImpl<$Res>
    implements $SummonerSpellCopyWith<$Res> {
  _$SummonerSpellCopyWithImpl(this._self, this._then);

  final SummonerSpell _self;
  final $Res Function(SummonerSpell) _then;

/// Create a copy of SummonerSpell
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cooldownSeconds = null,Object? spriteUrl = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,spriteUrl: null == spriteUrl ? _self.spriteUrl : spriteUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SummonerSpell].
extension SummonerSpellPatterns on SummonerSpell {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummonerSpell value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummonerSpell() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummonerSpell value)  $default,){
final _that = this;
switch (_that) {
case _SummonerSpell():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummonerSpell value)?  $default,){
final _that = this;
switch (_that) {
case _SummonerSpell() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int cooldownSeconds,  String spriteUrl,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummonerSpell() when $default != null:
return $default(_that.id,_that.name,_that.cooldownSeconds,_that.spriteUrl,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int cooldownSeconds,  String spriteUrl,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _SummonerSpell():
return $default(_that.id,_that.name,_that.cooldownSeconds,_that.spriteUrl,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int cooldownSeconds,  String spriteUrl,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _SummonerSpell() when $default != null:
return $default(_that.id,_that.name,_that.cooldownSeconds,_that.spriteUrl,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc


class _SummonerSpell implements SummonerSpell {
  const _SummonerSpell({required this.id, required this.name, required this.cooldownSeconds, required this.spriteUrl, required this.imageUrl});
  

@override final  String id;
@override final  String name;
@override final  int cooldownSeconds;
@override final  String spriteUrl;
@override final  String imageUrl;

/// Create a copy of SummonerSpell
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummonerSpellCopyWith<_SummonerSpell> get copyWith => __$SummonerSpellCopyWithImpl<_SummonerSpell>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummonerSpell&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds)&&(identical(other.spriteUrl, spriteUrl) || other.spriteUrl == spriteUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,cooldownSeconds,spriteUrl,imageUrl);

@override
String toString() {
  return 'SummonerSpell(id: $id, name: $name, cooldownSeconds: $cooldownSeconds, spriteUrl: $spriteUrl, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$SummonerSpellCopyWith<$Res> implements $SummonerSpellCopyWith<$Res> {
  factory _$SummonerSpellCopyWith(_SummonerSpell value, $Res Function(_SummonerSpell) _then) = __$SummonerSpellCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int cooldownSeconds, String spriteUrl, String imageUrl
});




}
/// @nodoc
class __$SummonerSpellCopyWithImpl<$Res>
    implements _$SummonerSpellCopyWith<$Res> {
  __$SummonerSpellCopyWithImpl(this._self, this._then);

  final _SummonerSpell _self;
  final $Res Function(_SummonerSpell) _then;

/// Create a copy of SummonerSpell
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cooldownSeconds = null,Object? spriteUrl = null,Object? imageUrl = null,}) {
  return _then(_SummonerSpell(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,spriteUrl: null == spriteUrl ? _self.spriteUrl : spriteUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
