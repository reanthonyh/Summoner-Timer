// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enemy_team_spell_timers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnemyTeamSpellTimersState {

 Map<String, SpellTimerData> get spellTimers;
/// Create a copy of EnemyTeamSpellTimersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnemyTeamSpellTimersStateCopyWith<EnemyTeamSpellTimersState> get copyWith => _$EnemyTeamSpellTimersStateCopyWithImpl<EnemyTeamSpellTimersState>(this as EnemyTeamSpellTimersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnemyTeamSpellTimersState&&const DeepCollectionEquality().equals(other.spellTimers, spellTimers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(spellTimers));

@override
String toString() {
  return 'EnemyTeamSpellTimersState(spellTimers: $spellTimers)';
}


}

/// @nodoc
abstract mixin class $EnemyTeamSpellTimersStateCopyWith<$Res>  {
  factory $EnemyTeamSpellTimersStateCopyWith(EnemyTeamSpellTimersState value, $Res Function(EnemyTeamSpellTimersState) _then) = _$EnemyTeamSpellTimersStateCopyWithImpl;
@useResult
$Res call({
 Map<String, SpellTimerData> spellTimers
});




}
/// @nodoc
class _$EnemyTeamSpellTimersStateCopyWithImpl<$Res>
    implements $EnemyTeamSpellTimersStateCopyWith<$Res> {
  _$EnemyTeamSpellTimersStateCopyWithImpl(this._self, this._then);

  final EnemyTeamSpellTimersState _self;
  final $Res Function(EnemyTeamSpellTimersState) _then;

/// Create a copy of EnemyTeamSpellTimersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spellTimers = null,}) {
  return _then(_self.copyWith(
spellTimers: null == spellTimers ? _self.spellTimers : spellTimers // ignore: cast_nullable_to_non_nullable
as Map<String, SpellTimerData>,
  ));
}

}


/// Adds pattern-matching-related methods to [EnemyTeamSpellTimersState].
extension EnemyTeamSpellTimersStatePatterns on EnemyTeamSpellTimersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnemyTeamSpellTimersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnemyTeamSpellTimersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnemyTeamSpellTimersState value)  $default,){
final _that = this;
switch (_that) {
case _EnemyTeamSpellTimersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnemyTeamSpellTimersState value)?  $default,){
final _that = this;
switch (_that) {
case _EnemyTeamSpellTimersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, SpellTimerData> spellTimers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnemyTeamSpellTimersState() when $default != null:
return $default(_that.spellTimers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, SpellTimerData> spellTimers)  $default,) {final _that = this;
switch (_that) {
case _EnemyTeamSpellTimersState():
return $default(_that.spellTimers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, SpellTimerData> spellTimers)?  $default,) {final _that = this;
switch (_that) {
case _EnemyTeamSpellTimersState() when $default != null:
return $default(_that.spellTimers);case _:
  return null;

}
}

}

/// @nodoc


class _EnemyTeamSpellTimersState implements EnemyTeamSpellTimersState {
  const _EnemyTeamSpellTimersState({final  Map<String, SpellTimerData> spellTimers = const {}}): _spellTimers = spellTimers;
  

 final  Map<String, SpellTimerData> _spellTimers;
@override@JsonKey() Map<String, SpellTimerData> get spellTimers {
  if (_spellTimers is EqualUnmodifiableMapView) return _spellTimers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_spellTimers);
}


/// Create a copy of EnemyTeamSpellTimersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnemyTeamSpellTimersStateCopyWith<_EnemyTeamSpellTimersState> get copyWith => __$EnemyTeamSpellTimersStateCopyWithImpl<_EnemyTeamSpellTimersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnemyTeamSpellTimersState&&const DeepCollectionEquality().equals(other._spellTimers, _spellTimers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_spellTimers));

@override
String toString() {
  return 'EnemyTeamSpellTimersState(spellTimers: $spellTimers)';
}


}

/// @nodoc
abstract mixin class _$EnemyTeamSpellTimersStateCopyWith<$Res> implements $EnemyTeamSpellTimersStateCopyWith<$Res> {
  factory _$EnemyTeamSpellTimersStateCopyWith(_EnemyTeamSpellTimersState value, $Res Function(_EnemyTeamSpellTimersState) _then) = __$EnemyTeamSpellTimersStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, SpellTimerData> spellTimers
});




}
/// @nodoc
class __$EnemyTeamSpellTimersStateCopyWithImpl<$Res>
    implements _$EnemyTeamSpellTimersStateCopyWith<$Res> {
  __$EnemyTeamSpellTimersStateCopyWithImpl(this._self, this._then);

  final _EnemyTeamSpellTimersState _self;
  final $Res Function(_EnemyTeamSpellTimersState) _then;

/// Create a copy of EnemyTeamSpellTimersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spellTimers = null,}) {
  return _then(_EnemyTeamSpellTimersState(
spellTimers: null == spellTimers ? _self._spellTimers : spellTimers // ignore: cast_nullable_to_non_nullable
as Map<String, SpellTimerData>,
  ));
}


}

// dart format on
