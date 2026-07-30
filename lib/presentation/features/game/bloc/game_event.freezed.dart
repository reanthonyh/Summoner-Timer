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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadGameEvent value)?  loadGame,TResult Function( _RetryLoadGameEvent value)?  retryLoadGame,TResult Function( _ResumeTimersEvent value)?  resumeTimers,TResult Function( _StartSpellTimerEvent value)?  startSpellTimer,TResult Function( _PrepareSpellTimerEvent value)?  prepareSpellTimer,TResult Function( _TickTimersEvent value)?  tickTimers,TResult Function( _ReorderEnemyPlayersEvent value)?  reorderEnemyPlayers,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadGameEvent() when loadGame != null:
return loadGame(_that);case _RetryLoadGameEvent() when retryLoadGame != null:
return retryLoadGame(_that);case _ResumeTimersEvent() when resumeTimers != null:
return resumeTimers(_that);case _StartSpellTimerEvent() when startSpellTimer != null:
return startSpellTimer(_that);case _PrepareSpellTimerEvent() when prepareSpellTimer != null:
return prepareSpellTimer(_that);case _TickTimersEvent() when tickTimers != null:
return tickTimers(_that);case _ReorderEnemyPlayersEvent() when reorderEnemyPlayers != null:
return reorderEnemyPlayers(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadGameEvent value)  loadGame,required TResult Function( _RetryLoadGameEvent value)  retryLoadGame,required TResult Function( _ResumeTimersEvent value)  resumeTimers,required TResult Function( _StartSpellTimerEvent value)  startSpellTimer,required TResult Function( _PrepareSpellTimerEvent value)  prepareSpellTimer,required TResult Function( _TickTimersEvent value)  tickTimers,required TResult Function( _ReorderEnemyPlayersEvent value)  reorderEnemyPlayers,}){
final _that = this;
switch (_that) {
case _LoadGameEvent():
return loadGame(_that);case _RetryLoadGameEvent():
return retryLoadGame(_that);case _ResumeTimersEvent():
return resumeTimers(_that);case _StartSpellTimerEvent():
return startSpellTimer(_that);case _PrepareSpellTimerEvent():
return prepareSpellTimer(_that);case _TickTimersEvent():
return tickTimers(_that);case _ReorderEnemyPlayersEvent():
return reorderEnemyPlayers(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadGameEvent value)?  loadGame,TResult? Function( _RetryLoadGameEvent value)?  retryLoadGame,TResult? Function( _ResumeTimersEvent value)?  resumeTimers,TResult? Function( _StartSpellTimerEvent value)?  startSpellTimer,TResult? Function( _PrepareSpellTimerEvent value)?  prepareSpellTimer,TResult? Function( _TickTimersEvent value)?  tickTimers,TResult? Function( _ReorderEnemyPlayersEvent value)?  reorderEnemyPlayers,}){
final _that = this;
switch (_that) {
case _LoadGameEvent() when loadGame != null:
return loadGame(_that);case _RetryLoadGameEvent() when retryLoadGame != null:
return retryLoadGame(_that);case _ResumeTimersEvent() when resumeTimers != null:
return resumeTimers(_that);case _StartSpellTimerEvent() when startSpellTimer != null:
return startSpellTimer(_that);case _PrepareSpellTimerEvent() when prepareSpellTimer != null:
return prepareSpellTimer(_that);case _TickTimersEvent() when tickTimers != null:
return tickTimers(_that);case _ReorderEnemyPlayersEvent() when reorderEnemyPlayers != null:
return reorderEnemyPlayers(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadGame,TResult Function()?  retryLoadGame,TResult Function()?  resumeTimers,TResult Function( String participantId,  int spellSlot)?  startSpellTimer,TResult Function( String participantId,  int spellSlot)?  prepareSpellTimer,TResult Function()?  tickTimers,TResult Function( int oldIndex,  int newIndex)?  reorderEnemyPlayers,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadGameEvent() when loadGame != null:
return loadGame();case _RetryLoadGameEvent() when retryLoadGame != null:
return retryLoadGame();case _ResumeTimersEvent() when resumeTimers != null:
return resumeTimers();case _StartSpellTimerEvent() when startSpellTimer != null:
return startSpellTimer(_that.participantId,_that.spellSlot);case _PrepareSpellTimerEvent() when prepareSpellTimer != null:
return prepareSpellTimer(_that.participantId,_that.spellSlot);case _TickTimersEvent() when tickTimers != null:
return tickTimers();case _ReorderEnemyPlayersEvent() when reorderEnemyPlayers != null:
return reorderEnemyPlayers(_that.oldIndex,_that.newIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadGame,required TResult Function()  retryLoadGame,required TResult Function()  resumeTimers,required TResult Function( String participantId,  int spellSlot)  startSpellTimer,required TResult Function( String participantId,  int spellSlot)  prepareSpellTimer,required TResult Function()  tickTimers,required TResult Function( int oldIndex,  int newIndex)  reorderEnemyPlayers,}) {final _that = this;
switch (_that) {
case _LoadGameEvent():
return loadGame();case _RetryLoadGameEvent():
return retryLoadGame();case _ResumeTimersEvent():
return resumeTimers();case _StartSpellTimerEvent():
return startSpellTimer(_that.participantId,_that.spellSlot);case _PrepareSpellTimerEvent():
return prepareSpellTimer(_that.participantId,_that.spellSlot);case _TickTimersEvent():
return tickTimers();case _ReorderEnemyPlayersEvent():
return reorderEnemyPlayers(_that.oldIndex,_that.newIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadGame,TResult? Function()?  retryLoadGame,TResult? Function()?  resumeTimers,TResult? Function( String participantId,  int spellSlot)?  startSpellTimer,TResult? Function( String participantId,  int spellSlot)?  prepareSpellTimer,TResult? Function()?  tickTimers,TResult? Function( int oldIndex,  int newIndex)?  reorderEnemyPlayers,}) {final _that = this;
switch (_that) {
case _LoadGameEvent() when loadGame != null:
return loadGame();case _RetryLoadGameEvent() when retryLoadGame != null:
return retryLoadGame();case _ResumeTimersEvent() when resumeTimers != null:
return resumeTimers();case _StartSpellTimerEvent() when startSpellTimer != null:
return startSpellTimer(_that.participantId,_that.spellSlot);case _PrepareSpellTimerEvent() when prepareSpellTimer != null:
return prepareSpellTimer(_that.participantId,_that.spellSlot);case _TickTimersEvent() when tickTimers != null:
return tickTimers();case _ReorderEnemyPlayersEvent() when reorderEnemyPlayers != null:
return reorderEnemyPlayers(_that.oldIndex,_that.newIndex);case _:
  return null;

}
}

}

/// @nodoc


class _LoadGameEvent implements GameEvent {
  const _LoadGameEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadGameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.loadGame()';
}


}




/// @nodoc


class _RetryLoadGameEvent implements GameEvent {
  const _RetryLoadGameEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RetryLoadGameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.retryLoadGame()';
}


}




/// @nodoc


class _ResumeTimersEvent implements GameEvent {
  const _ResumeTimersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumeTimersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.resumeTimers()';
}


}




/// @nodoc


class _StartSpellTimerEvent implements GameEvent {
  const _StartSpellTimerEvent({required this.participantId, required this.spellSlot});
  

 final  String participantId;
 final  int spellSlot;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartSpellTimerEventCopyWith<_StartSpellTimerEvent> get copyWith => __$StartSpellTimerEventCopyWithImpl<_StartSpellTimerEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartSpellTimerEvent&&(identical(other.participantId, participantId) || other.participantId == participantId)&&(identical(other.spellSlot, spellSlot) || other.spellSlot == spellSlot));
}


@override
int get hashCode => Object.hash(runtimeType,participantId,spellSlot);

@override
String toString() {
  return 'GameEvent.startSpellTimer(participantId: $participantId, spellSlot: $spellSlot)';
}


}

/// @nodoc
abstract mixin class _$StartSpellTimerEventCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$StartSpellTimerEventCopyWith(_StartSpellTimerEvent value, $Res Function(_StartSpellTimerEvent) _then) = __$StartSpellTimerEventCopyWithImpl;
@useResult
$Res call({
 String participantId, int spellSlot
});




}
/// @nodoc
class __$StartSpellTimerEventCopyWithImpl<$Res>
    implements _$StartSpellTimerEventCopyWith<$Res> {
  __$StartSpellTimerEventCopyWithImpl(this._self, this._then);

  final _StartSpellTimerEvent _self;
  final $Res Function(_StartSpellTimerEvent) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participantId = null,Object? spellSlot = null,}) {
  return _then(_StartSpellTimerEvent(
participantId: null == participantId ? _self.participantId : participantId // ignore: cast_nullable_to_non_nullable
as String,spellSlot: null == spellSlot ? _self.spellSlot : spellSlot // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _PrepareSpellTimerEvent implements GameEvent {
  const _PrepareSpellTimerEvent({required this.participantId, required this.spellSlot});
  

 final  String participantId;
 final  int spellSlot;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrepareSpellTimerEventCopyWith<_PrepareSpellTimerEvent> get copyWith => __$PrepareSpellTimerEventCopyWithImpl<_PrepareSpellTimerEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrepareSpellTimerEvent&&(identical(other.participantId, participantId) || other.participantId == participantId)&&(identical(other.spellSlot, spellSlot) || other.spellSlot == spellSlot));
}


@override
int get hashCode => Object.hash(runtimeType,participantId,spellSlot);

@override
String toString() {
  return 'GameEvent.prepareSpellTimer(participantId: $participantId, spellSlot: $spellSlot)';
}


}

/// @nodoc
abstract mixin class _$PrepareSpellTimerEventCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$PrepareSpellTimerEventCopyWith(_PrepareSpellTimerEvent value, $Res Function(_PrepareSpellTimerEvent) _then) = __$PrepareSpellTimerEventCopyWithImpl;
@useResult
$Res call({
 String participantId, int spellSlot
});




}
/// @nodoc
class __$PrepareSpellTimerEventCopyWithImpl<$Res>
    implements _$PrepareSpellTimerEventCopyWith<$Res> {
  __$PrepareSpellTimerEventCopyWithImpl(this._self, this._then);

  final _PrepareSpellTimerEvent _self;
  final $Res Function(_PrepareSpellTimerEvent) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participantId = null,Object? spellSlot = null,}) {
  return _then(_PrepareSpellTimerEvent(
participantId: null == participantId ? _self.participantId : participantId // ignore: cast_nullable_to_non_nullable
as String,spellSlot: null == spellSlot ? _self.spellSlot : spellSlot // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _TickTimersEvent implements GameEvent {
  const _TickTimersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TickTimersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.tickTimers()';
}


}




/// @nodoc


class _ReorderEnemyPlayersEvent implements GameEvent {
  const _ReorderEnemyPlayersEvent({required this.oldIndex, required this.newIndex});
  

 final  int oldIndex;
 final  int newIndex;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReorderEnemyPlayersEventCopyWith<_ReorderEnemyPlayersEvent> get copyWith => __$ReorderEnemyPlayersEventCopyWithImpl<_ReorderEnemyPlayersEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReorderEnemyPlayersEvent&&(identical(other.oldIndex, oldIndex) || other.oldIndex == oldIndex)&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex));
}


@override
int get hashCode => Object.hash(runtimeType,oldIndex,newIndex);

@override
String toString() {
  return 'GameEvent.reorderEnemyPlayers(oldIndex: $oldIndex, newIndex: $newIndex)';
}


}

/// @nodoc
abstract mixin class _$ReorderEnemyPlayersEventCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$ReorderEnemyPlayersEventCopyWith(_ReorderEnemyPlayersEvent value, $Res Function(_ReorderEnemyPlayersEvent) _then) = __$ReorderEnemyPlayersEventCopyWithImpl;
@useResult
$Res call({
 int oldIndex, int newIndex
});




}
/// @nodoc
class __$ReorderEnemyPlayersEventCopyWithImpl<$Res>
    implements _$ReorderEnemyPlayersEventCopyWith<$Res> {
  __$ReorderEnemyPlayersEventCopyWithImpl(this._self, this._then);

  final _ReorderEnemyPlayersEvent _self;
  final $Res Function(_ReorderEnemyPlayersEvent) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldIndex = null,Object? newIndex = null,}) {
  return _then(_ReorderEnemyPlayersEvent(
oldIndex: null == oldIndex ? _self.oldIndex : oldIndex // ignore: cast_nullable_to_non_nullable
as int,newIndex: null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
