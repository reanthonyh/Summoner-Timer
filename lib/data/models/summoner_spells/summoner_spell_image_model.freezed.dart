// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summoner_spell_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SummonerSpellImageModel {

 String? get full; String? get sprite; String? get group; int? get x; int? get y; int? get w; int? get h;
/// Create a copy of SummonerSpellImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummonerSpellImageModelCopyWith<SummonerSpellImageModel> get copyWith => _$SummonerSpellImageModelCopyWithImpl<SummonerSpellImageModel>(this as SummonerSpellImageModel, _$identity);

  /// Serializes this SummonerSpellImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummonerSpellImageModel&&(identical(other.full, full) || other.full == full)&&(identical(other.sprite, sprite) || other.sprite == sprite)&&(identical(other.group, group) || other.group == group)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.w, w) || other.w == w)&&(identical(other.h, h) || other.h == h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,full,sprite,group,x,y,w,h);

@override
String toString() {
  return 'SummonerSpellImageModel(full: $full, sprite: $sprite, group: $group, x: $x, y: $y, w: $w, h: $h)';
}


}

/// @nodoc
abstract mixin class $SummonerSpellImageModelCopyWith<$Res>  {
  factory $SummonerSpellImageModelCopyWith(SummonerSpellImageModel value, $Res Function(SummonerSpellImageModel) _then) = _$SummonerSpellImageModelCopyWithImpl;
@useResult
$Res call({
 String? full, String? sprite, String? group, int? x, int? y, int? w, int? h
});




}
/// @nodoc
class _$SummonerSpellImageModelCopyWithImpl<$Res>
    implements $SummonerSpellImageModelCopyWith<$Res> {
  _$SummonerSpellImageModelCopyWithImpl(this._self, this._then);

  final SummonerSpellImageModel _self;
  final $Res Function(SummonerSpellImageModel) _then;

/// Create a copy of SummonerSpellImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? full = freezed,Object? sprite = freezed,Object? group = freezed,Object? x = freezed,Object? y = freezed,Object? w = freezed,Object? h = freezed,}) {
  return _then(_self.copyWith(
full: freezed == full ? _self.full : full // ignore: cast_nullable_to_non_nullable
as String?,sprite: freezed == sprite ? _self.sprite : sprite // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,x: freezed == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int?,y: freezed == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int?,w: freezed == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as int?,h: freezed == h ? _self.h : h // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SummonerSpellImageModel].
extension SummonerSpellImageModelPatterns on SummonerSpellImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummonerSpellImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummonerSpellImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummonerSpellImageModel value)  $default,){
final _that = this;
switch (_that) {
case _SummonerSpellImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummonerSpellImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _SummonerSpellImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? full,  String? sprite,  String? group,  int? x,  int? y,  int? w,  int? h)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummonerSpellImageModel() when $default != null:
return $default(_that.full,_that.sprite,_that.group,_that.x,_that.y,_that.w,_that.h);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? full,  String? sprite,  String? group,  int? x,  int? y,  int? w,  int? h)  $default,) {final _that = this;
switch (_that) {
case _SummonerSpellImageModel():
return $default(_that.full,_that.sprite,_that.group,_that.x,_that.y,_that.w,_that.h);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? full,  String? sprite,  String? group,  int? x,  int? y,  int? w,  int? h)?  $default,) {final _that = this;
switch (_that) {
case _SummonerSpellImageModel() when $default != null:
return $default(_that.full,_that.sprite,_that.group,_that.x,_that.y,_that.w,_that.h);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummonerSpellImageModel implements SummonerSpellImageModel {
  const _SummonerSpellImageModel({this.full, this.sprite, this.group, this.x, this.y, this.w, this.h});
  factory _SummonerSpellImageModel.fromJson(Map<String, dynamic> json) => _$SummonerSpellImageModelFromJson(json);

@override final  String? full;
@override final  String? sprite;
@override final  String? group;
@override final  int? x;
@override final  int? y;
@override final  int? w;
@override final  int? h;

/// Create a copy of SummonerSpellImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummonerSpellImageModelCopyWith<_SummonerSpellImageModel> get copyWith => __$SummonerSpellImageModelCopyWithImpl<_SummonerSpellImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummonerSpellImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummonerSpellImageModel&&(identical(other.full, full) || other.full == full)&&(identical(other.sprite, sprite) || other.sprite == sprite)&&(identical(other.group, group) || other.group == group)&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.w, w) || other.w == w)&&(identical(other.h, h) || other.h == h));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,full,sprite,group,x,y,w,h);

@override
String toString() {
  return 'SummonerSpellImageModel(full: $full, sprite: $sprite, group: $group, x: $x, y: $y, w: $w, h: $h)';
}


}

/// @nodoc
abstract mixin class _$SummonerSpellImageModelCopyWith<$Res> implements $SummonerSpellImageModelCopyWith<$Res> {
  factory _$SummonerSpellImageModelCopyWith(_SummonerSpellImageModel value, $Res Function(_SummonerSpellImageModel) _then) = __$SummonerSpellImageModelCopyWithImpl;
@override @useResult
$Res call({
 String? full, String? sprite, String? group, int? x, int? y, int? w, int? h
});




}
/// @nodoc
class __$SummonerSpellImageModelCopyWithImpl<$Res>
    implements _$SummonerSpellImageModelCopyWith<$Res> {
  __$SummonerSpellImageModelCopyWithImpl(this._self, this._then);

  final _SummonerSpellImageModel _self;
  final $Res Function(_SummonerSpellImageModel) _then;

/// Create a copy of SummonerSpellImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? full = freezed,Object? sprite = freezed,Object? group = freezed,Object? x = freezed,Object? y = freezed,Object? w = freezed,Object? h = freezed,}) {
  return _then(_SummonerSpellImageModel(
full: freezed == full ? _self.full : full // ignore: cast_nullable_to_non_nullable
as String?,sprite: freezed == sprite ? _self.sprite : sprite // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String?,x: freezed == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int?,y: freezed == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int?,w: freezed == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as int?,h: freezed == h ? _self.h : h // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
