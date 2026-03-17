// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent()';
}


}

/// @nodoc
class $GameEventCopyWith<$Res>  {
$GameEventCopyWith(GameEvent _, $Res Function(GameEvent) __);
}


/// Adds pattern-matching-related methods to [GameEvent].
extension GameEventPatterns on GameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadGameEvent value)?  loadGame,TResult Function( RetryLoadGameEvent value)?  retryLoadGame,TResult Function( ResumeTimersEvent value)?  resumeTimers,TResult Function( StartSpellTimerEvent value)?  startSpellTimer,TResult Function( PrepareSpellTimerEvent value)?  prepareSpellTimer,TResult Function( TickTimersEvent value)?  tickTimers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadGameEvent() when loadGame != null:
return loadGame(_that);case RetryLoadGameEvent() when retryLoadGame != null:
return retryLoadGame(_that);case ResumeTimersEvent() when resumeTimers != null:
return resumeTimers(_that);case StartSpellTimerEvent() when startSpellTimer != null:
return startSpellTimer(_that);case PrepareSpellTimerEvent() when prepareSpellTimer != null:
return prepareSpellTimer(_that);case TickTimersEvent() when tickTimers != null:
return tickTimers(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadGameEvent value)  loadGame,required TResult Function( RetryLoadGameEvent value)  retryLoadGame,required TResult Function( ResumeTimersEvent value)  resumeTimers,required TResult Function( StartSpellTimerEvent value)  startSpellTimer,required TResult Function( PrepareSpellTimerEvent value)  prepareSpellTimer,required TResult Function( TickTimersEvent value)  tickTimers,}){
final _that = this;
switch (_that) {
case LoadGameEvent():
return loadGame(_that);case RetryLoadGameEvent():
return retryLoadGame(_that);case ResumeTimersEvent():
return resumeTimers(_that);case StartSpellTimerEvent():
return startSpellTimer(_that);case PrepareSpellTimerEvent():
return prepareSpellTimer(_that);case TickTimersEvent():
return tickTimers(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadGameEvent value)?  loadGame,TResult? Function( RetryLoadGameEvent value)?  retryLoadGame,TResult? Function( ResumeTimersEvent value)?  resumeTimers,TResult? Function( StartSpellTimerEvent value)?  startSpellTimer,TResult? Function( PrepareSpellTimerEvent value)?  prepareSpellTimer,TResult? Function( TickTimersEvent value)?  tickTimers,}){
final _that = this;
switch (_that) {
case LoadGameEvent() when loadGame != null:
return loadGame(_that);case RetryLoadGameEvent() when retryLoadGame != null:
return retryLoadGame(_that);case ResumeTimersEvent() when resumeTimers != null:
return resumeTimers(_that);case StartSpellTimerEvent() when startSpellTimer != null:
return startSpellTimer(_that);case PrepareSpellTimerEvent() when prepareSpellTimer != null:
return prepareSpellTimer(_that);case TickTimersEvent() when tickTimers != null:
return tickTimers(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadGame,TResult Function()?  retryLoadGame,TResult Function()?  resumeTimers,TResult Function( String participantId,  int spellSlot)?  startSpellTimer,TResult Function( String participantId,  int spellSlot)?  prepareSpellTimer,TResult Function()?  tickTimers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadGameEvent() when loadGame != null:
return loadGame();case RetryLoadGameEvent() when retryLoadGame != null:
return retryLoadGame();case ResumeTimersEvent() when resumeTimers != null:
return resumeTimers();case StartSpellTimerEvent() when startSpellTimer != null:
return startSpellTimer(_that.participantId,_that.spellSlot);case PrepareSpellTimerEvent() when prepareSpellTimer != null:
return prepareSpellTimer(_that.participantId,_that.spellSlot);case TickTimersEvent() when tickTimers != null:
return tickTimers();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadGame,required TResult Function()  retryLoadGame,required TResult Function()  resumeTimers,required TResult Function( String participantId,  int spellSlot)  startSpellTimer,required TResult Function( String participantId,  int spellSlot)  prepareSpellTimer,required TResult Function()  tickTimers,}) {final _that = this;
switch (_that) {
case LoadGameEvent():
return loadGame();case RetryLoadGameEvent():
return retryLoadGame();case ResumeTimersEvent():
return resumeTimers();case StartSpellTimerEvent():
return startSpellTimer(_that.participantId,_that.spellSlot);case PrepareSpellTimerEvent():
return prepareSpellTimer(_that.participantId,_that.spellSlot);case TickTimersEvent():
return tickTimers();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadGame,TResult? Function()?  retryLoadGame,TResult? Function()?  resumeTimers,TResult? Function( String participantId,  int spellSlot)?  startSpellTimer,TResult? Function( String participantId,  int spellSlot)?  prepareSpellTimer,TResult? Function()?  tickTimers,}) {final _that = this;
switch (_that) {
case LoadGameEvent() when loadGame != null:
return loadGame();case RetryLoadGameEvent() when retryLoadGame != null:
return retryLoadGame();case ResumeTimersEvent() when resumeTimers != null:
return resumeTimers();case StartSpellTimerEvent() when startSpellTimer != null:
return startSpellTimer(_that.participantId,_that.spellSlot);case PrepareSpellTimerEvent() when prepareSpellTimer != null:
return prepareSpellTimer(_that.participantId,_that.spellSlot);case TickTimersEvent() when tickTimers != null:
return tickTimers();case _:
  return null;

}
}

}

/// @nodoc


class LoadGameEvent implements GameEvent {
  const LoadGameEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadGameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.loadGame()';
}


}




/// @nodoc


class RetryLoadGameEvent implements GameEvent {
  const RetryLoadGameEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RetryLoadGameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.retryLoadGame()';
}


}




/// @nodoc


class ResumeTimersEvent implements GameEvent {
  const ResumeTimersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResumeTimersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.resumeTimers()';
}


}




/// @nodoc


class StartSpellTimerEvent implements GameEvent {
  const StartSpellTimerEvent({required this.participantId, required this.spellSlot});
  

 final  String participantId;
 final  int spellSlot;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartSpellTimerEventCopyWith<StartSpellTimerEvent> get copyWith => _$StartSpellTimerEventCopyWithImpl<StartSpellTimerEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartSpellTimerEvent&&(identical(other.participantId, participantId) || other.participantId == participantId)&&(identical(other.spellSlot, spellSlot) || other.spellSlot == spellSlot));
}


@override
int get hashCode => Object.hash(runtimeType,participantId,spellSlot);

@override
String toString() {
  return 'GameEvent.startSpellTimer(participantId: $participantId, spellSlot: $spellSlot)';
}


}

/// @nodoc
abstract mixin class $StartSpellTimerEventCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory $StartSpellTimerEventCopyWith(StartSpellTimerEvent value, $Res Function(StartSpellTimerEvent) _then) = _$StartSpellTimerEventCopyWithImpl;
@useResult
$Res call({
 String participantId, int spellSlot
});




}
/// @nodoc
class _$StartSpellTimerEventCopyWithImpl<$Res>
    implements $StartSpellTimerEventCopyWith<$Res> {
  _$StartSpellTimerEventCopyWithImpl(this._self, this._then);

  final StartSpellTimerEvent _self;
  final $Res Function(StartSpellTimerEvent) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participantId = null,Object? spellSlot = null,}) {
  return _then(StartSpellTimerEvent(
participantId: null == participantId ? _self.participantId : participantId // ignore: cast_nullable_to_non_nullable
as String,spellSlot: null == spellSlot ? _self.spellSlot : spellSlot // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PrepareSpellTimerEvent implements GameEvent {
  const PrepareSpellTimerEvent({required this.participantId, required this.spellSlot});
  

 final  String participantId;
 final  int spellSlot;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrepareSpellTimerEventCopyWith<PrepareSpellTimerEvent> get copyWith => _$PrepareSpellTimerEventCopyWithImpl<PrepareSpellTimerEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrepareSpellTimerEvent&&(identical(other.participantId, participantId) || other.participantId == participantId)&&(identical(other.spellSlot, spellSlot) || other.spellSlot == spellSlot));
}


@override
int get hashCode => Object.hash(runtimeType,participantId,spellSlot);

@override
String toString() {
  return 'GameEvent.prepareSpellTimer(participantId: $participantId, spellSlot: $spellSlot)';
}


}

/// @nodoc
abstract mixin class $PrepareSpellTimerEventCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory $PrepareSpellTimerEventCopyWith(PrepareSpellTimerEvent value, $Res Function(PrepareSpellTimerEvent) _then) = _$PrepareSpellTimerEventCopyWithImpl;
@useResult
$Res call({
 String participantId, int spellSlot
});




}
/// @nodoc
class _$PrepareSpellTimerEventCopyWithImpl<$Res>
    implements $PrepareSpellTimerEventCopyWith<$Res> {
  _$PrepareSpellTimerEventCopyWithImpl(this._self, this._then);

  final PrepareSpellTimerEvent _self;
  final $Res Function(PrepareSpellTimerEvent) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participantId = null,Object? spellSlot = null,}) {
  return _then(PrepareSpellTimerEvent(
participantId: null == participantId ? _self.participantId : participantId // ignore: cast_nullable_to_non_nullable
as String,spellSlot: null == spellSlot ? _self.spellSlot : spellSlot // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class TickTimersEvent implements GameEvent {
  const TickTimersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TickTimersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.tickTimers()';
}


}




// dart format on
