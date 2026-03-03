// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spell_timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SpellTimerState {

 int get remainingSeconds; bool get isActive; double get progress;
/// Create a copy of SpellTimerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpellTimerStateCopyWith<SpellTimerState> get copyWith => _$SpellTimerStateCopyWithImpl<SpellTimerState>(this as SpellTimerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpellTimerState&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,remainingSeconds,isActive,progress);

@override
String toString() {
  return 'SpellTimerState(remainingSeconds: $remainingSeconds, isActive: $isActive, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $SpellTimerStateCopyWith<$Res>  {
  factory $SpellTimerStateCopyWith(SpellTimerState value, $Res Function(SpellTimerState) _then) = _$SpellTimerStateCopyWithImpl;
@useResult
$Res call({
 int remainingSeconds, bool isActive, double progress
});




}
/// @nodoc
class _$SpellTimerStateCopyWithImpl<$Res>
    implements $SpellTimerStateCopyWith<$Res> {
  _$SpellTimerStateCopyWithImpl(this._self, this._then);

  final SpellTimerState _self;
  final $Res Function(SpellTimerState) _then;

/// Create a copy of SpellTimerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remainingSeconds = null,Object? isActive = null,Object? progress = null,}) {
  return _then(_self.copyWith(
remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SpellTimerState].
extension SpellTimerStatePatterns on SpellTimerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpellTimerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpellTimerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpellTimerState value)  $default,){
final _that = this;
switch (_that) {
case _SpellTimerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpellTimerState value)?  $default,){
final _that = this;
switch (_that) {
case _SpellTimerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int remainingSeconds,  bool isActive,  double progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpellTimerState() when $default != null:
return $default(_that.remainingSeconds,_that.isActive,_that.progress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int remainingSeconds,  bool isActive,  double progress)  $default,) {final _that = this;
switch (_that) {
case _SpellTimerState():
return $default(_that.remainingSeconds,_that.isActive,_that.progress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int remainingSeconds,  bool isActive,  double progress)?  $default,) {final _that = this;
switch (_that) {
case _SpellTimerState() when $default != null:
return $default(_that.remainingSeconds,_that.isActive,_that.progress);case _:
  return null;

}
}

}

/// @nodoc


class _SpellTimerState implements SpellTimerState {
  const _SpellTimerState({this.remainingSeconds = 0, this.isActive = false, this.progress = 1.0});
  

@override@JsonKey() final  int remainingSeconds;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  double progress;

/// Create a copy of SpellTimerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpellTimerStateCopyWith<_SpellTimerState> get copyWith => __$SpellTimerStateCopyWithImpl<_SpellTimerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpellTimerState&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,remainingSeconds,isActive,progress);

@override
String toString() {
  return 'SpellTimerState(remainingSeconds: $remainingSeconds, isActive: $isActive, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$SpellTimerStateCopyWith<$Res> implements $SpellTimerStateCopyWith<$Res> {
  factory _$SpellTimerStateCopyWith(_SpellTimerState value, $Res Function(_SpellTimerState) _then) = __$SpellTimerStateCopyWithImpl;
@override @useResult
$Res call({
 int remainingSeconds, bool isActive, double progress
});




}
/// @nodoc
class __$SpellTimerStateCopyWithImpl<$Res>
    implements _$SpellTimerStateCopyWith<$Res> {
  __$SpellTimerStateCopyWithImpl(this._self, this._then);

  final _SpellTimerState _self;
  final $Res Function(_SpellTimerState) _then;

/// Create a copy of SpellTimerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remainingSeconds = null,Object? isActive = null,Object? progress = null,}) {
  return _then(_SpellTimerState(
remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
