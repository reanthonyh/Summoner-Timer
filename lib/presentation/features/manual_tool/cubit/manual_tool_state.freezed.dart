// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manual_tool_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManualToolState {

 ManualToolMode get mode; int get enemyCount; List<ManualEnemy> get enemies; List<SummonerSpell> get availableSpells;
/// Create a copy of ManualToolState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManualToolStateCopyWith<ManualToolState> get copyWith => _$ManualToolStateCopyWithImpl<ManualToolState>(this as ManualToolState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManualToolState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.enemyCount, enemyCount) || other.enemyCount == enemyCount)&&const DeepCollectionEquality().equals(other.enemies, enemies)&&const DeepCollectionEquality().equals(other.availableSpells, availableSpells));
}


@override
int get hashCode => Object.hash(runtimeType,mode,enemyCount,const DeepCollectionEquality().hash(enemies),const DeepCollectionEquality().hash(availableSpells));

@override
String toString() {
  return 'ManualToolState(mode: $mode, enemyCount: $enemyCount, enemies: $enemies, availableSpells: $availableSpells)';
}


}

/// @nodoc
abstract mixin class $ManualToolStateCopyWith<$Res>  {
  factory $ManualToolStateCopyWith(ManualToolState value, $Res Function(ManualToolState) _then) = _$ManualToolStateCopyWithImpl;
@useResult
$Res call({
 ManualToolMode mode, int enemyCount, List<ManualEnemy> enemies, List<SummonerSpell> availableSpells
});




}
/// @nodoc
class _$ManualToolStateCopyWithImpl<$Res>
    implements $ManualToolStateCopyWith<$Res> {
  _$ManualToolStateCopyWithImpl(this._self, this._then);

  final ManualToolState _self;
  final $Res Function(ManualToolState) _then;

/// Create a copy of ManualToolState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? enemyCount = null,Object? enemies = null,Object? availableSpells = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ManualToolMode,enemyCount: null == enemyCount ? _self.enemyCount : enemyCount // ignore: cast_nullable_to_non_nullable
as int,enemies: null == enemies ? _self.enemies : enemies // ignore: cast_nullable_to_non_nullable
as List<ManualEnemy>,availableSpells: null == availableSpells ? _self.availableSpells : availableSpells // ignore: cast_nullable_to_non_nullable
as List<SummonerSpell>,
  ));
}

}


/// Adds pattern-matching-related methods to [ManualToolState].
extension ManualToolStatePatterns on ManualToolState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManualToolState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManualToolState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManualToolState value)  $default,){
final _that = this;
switch (_that) {
case _ManualToolState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManualToolState value)?  $default,){
final _that = this;
switch (_that) {
case _ManualToolState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ManualToolMode mode,  int enemyCount,  List<ManualEnemy> enemies,  List<SummonerSpell> availableSpells)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManualToolState() when $default != null:
return $default(_that.mode,_that.enemyCount,_that.enemies,_that.availableSpells);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ManualToolMode mode,  int enemyCount,  List<ManualEnemy> enemies,  List<SummonerSpell> availableSpells)  $default,) {final _that = this;
switch (_that) {
case _ManualToolState():
return $default(_that.mode,_that.enemyCount,_that.enemies,_that.availableSpells);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ManualToolMode mode,  int enemyCount,  List<ManualEnemy> enemies,  List<SummonerSpell> availableSpells)?  $default,) {final _that = this;
switch (_that) {
case _ManualToolState() when $default != null:
return $default(_that.mode,_that.enemyCount,_that.enemies,_that.availableSpells);case _:
  return null;

}
}

}

/// @nodoc


class _ManualToolState implements ManualToolState {
  const _ManualToolState({this.mode = ManualToolMode.setup, this.enemyCount = 5, final  List<ManualEnemy> enemies = const [], final  List<SummonerSpell> availableSpells = const []}): _enemies = enemies,_availableSpells = availableSpells;
  

@override@JsonKey() final  ManualToolMode mode;
@override@JsonKey() final  int enemyCount;
 final  List<ManualEnemy> _enemies;
@override@JsonKey() List<ManualEnemy> get enemies {
  if (_enemies is EqualUnmodifiableListView) return _enemies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_enemies);
}

 final  List<SummonerSpell> _availableSpells;
@override@JsonKey() List<SummonerSpell> get availableSpells {
  if (_availableSpells is EqualUnmodifiableListView) return _availableSpells;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableSpells);
}


/// Create a copy of ManualToolState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManualToolStateCopyWith<_ManualToolState> get copyWith => __$ManualToolStateCopyWithImpl<_ManualToolState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManualToolState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.enemyCount, enemyCount) || other.enemyCount == enemyCount)&&const DeepCollectionEquality().equals(other._enemies, _enemies)&&const DeepCollectionEquality().equals(other._availableSpells, _availableSpells));
}


@override
int get hashCode => Object.hash(runtimeType,mode,enemyCount,const DeepCollectionEquality().hash(_enemies),const DeepCollectionEquality().hash(_availableSpells));

@override
String toString() {
  return 'ManualToolState(mode: $mode, enemyCount: $enemyCount, enemies: $enemies, availableSpells: $availableSpells)';
}


}

/// @nodoc
abstract mixin class _$ManualToolStateCopyWith<$Res> implements $ManualToolStateCopyWith<$Res> {
  factory _$ManualToolStateCopyWith(_ManualToolState value, $Res Function(_ManualToolState) _then) = __$ManualToolStateCopyWithImpl;
@override @useResult
$Res call({
 ManualToolMode mode, int enemyCount, List<ManualEnemy> enemies, List<SummonerSpell> availableSpells
});




}
/// @nodoc
class __$ManualToolStateCopyWithImpl<$Res>
    implements _$ManualToolStateCopyWith<$Res> {
  __$ManualToolStateCopyWithImpl(this._self, this._then);

  final _ManualToolState _self;
  final $Res Function(_ManualToolState) _then;

/// Create a copy of ManualToolState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? enemyCount = null,Object? enemies = null,Object? availableSpells = null,}) {
  return _then(_ManualToolState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ManualToolMode,enemyCount: null == enemyCount ? _self.enemyCount : enemyCount // ignore: cast_nullable_to_non_nullable
as int,enemies: null == enemies ? _self._enemies : enemies // ignore: cast_nullable_to_non_nullable
as List<ManualEnemy>,availableSpells: null == availableSpells ? _self._availableSpells : availableSpells // ignore: cast_nullable_to_non_nullable
as List<SummonerSpell>,
  ));
}


}

// dart format on
