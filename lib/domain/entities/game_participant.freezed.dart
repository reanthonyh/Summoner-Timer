// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_participant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameParticipant {

 String? get puuid; bool get isBot; SummonerSpell get spellOne; SummonerSpell get spellTwo; String get riotId; int get championId;
/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameParticipantCopyWith<GameParticipant> get copyWith => _$GameParticipantCopyWithImpl<GameParticipant>(this as GameParticipant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameParticipant&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.isBot, isBot) || other.isBot == isBot)&&(identical(other.spellOne, spellOne) || other.spellOne == spellOne)&&(identical(other.spellTwo, spellTwo) || other.spellTwo == spellTwo)&&(identical(other.riotId, riotId) || other.riotId == riotId)&&(identical(other.championId, championId) || other.championId == championId));
}


@override
int get hashCode => Object.hash(runtimeType,puuid,isBot,spellOne,spellTwo,riotId,championId);

@override
String toString() {
  return 'GameParticipant(puuid: $puuid, isBot: $isBot, spellOne: $spellOne, spellTwo: $spellTwo, riotId: $riotId, championId: $championId)';
}


}

/// @nodoc
abstract mixin class $GameParticipantCopyWith<$Res>  {
  factory $GameParticipantCopyWith(GameParticipant value, $Res Function(GameParticipant) _then) = _$GameParticipantCopyWithImpl;
@useResult
$Res call({
 String? puuid, bool isBot, SummonerSpell spellOne, SummonerSpell spellTwo, String riotId, int championId
});


$SummonerSpellCopyWith<$Res> get spellOne;$SummonerSpellCopyWith<$Res> get spellTwo;

}
/// @nodoc
class _$GameParticipantCopyWithImpl<$Res>
    implements $GameParticipantCopyWith<$Res> {
  _$GameParticipantCopyWithImpl(this._self, this._then);

  final GameParticipant _self;
  final $Res Function(GameParticipant) _then;

/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? puuid = freezed,Object? isBot = null,Object? spellOne = null,Object? spellTwo = null,Object? riotId = null,Object? championId = null,}) {
  return _then(_self.copyWith(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,isBot: null == isBot ? _self.isBot : isBot // ignore: cast_nullable_to_non_nullable
as bool,spellOne: null == spellOne ? _self.spellOne : spellOne // ignore: cast_nullable_to_non_nullable
as SummonerSpell,spellTwo: null == spellTwo ? _self.spellTwo : spellTwo // ignore: cast_nullable_to_non_nullable
as SummonerSpell,riotId: null == riotId ? _self.riotId : riotId // ignore: cast_nullable_to_non_nullable
as String,championId: null == championId ? _self.championId : championId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummonerSpellCopyWith<$Res> get spellOne {
  
  return $SummonerSpellCopyWith<$Res>(_self.spellOne, (value) {
    return _then(_self.copyWith(spellOne: value));
  });
}/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummonerSpellCopyWith<$Res> get spellTwo {
  
  return $SummonerSpellCopyWith<$Res>(_self.spellTwo, (value) {
    return _then(_self.copyWith(spellTwo: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameParticipant].
extension GameParticipantPatterns on GameParticipant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameParticipant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameParticipant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameParticipant value)  $default,){
final _that = this;
switch (_that) {
case _GameParticipant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameParticipant value)?  $default,){
final _that = this;
switch (_that) {
case _GameParticipant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? puuid,  bool isBot,  SummonerSpell spellOne,  SummonerSpell spellTwo,  String riotId,  int championId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameParticipant() when $default != null:
return $default(_that.puuid,_that.isBot,_that.spellOne,_that.spellTwo,_that.riotId,_that.championId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? puuid,  bool isBot,  SummonerSpell spellOne,  SummonerSpell spellTwo,  String riotId,  int championId)  $default,) {final _that = this;
switch (_that) {
case _GameParticipant():
return $default(_that.puuid,_that.isBot,_that.spellOne,_that.spellTwo,_that.riotId,_that.championId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? puuid,  bool isBot,  SummonerSpell spellOne,  SummonerSpell spellTwo,  String riotId,  int championId)?  $default,) {final _that = this;
switch (_that) {
case _GameParticipant() when $default != null:
return $default(_that.puuid,_that.isBot,_that.spellOne,_that.spellTwo,_that.riotId,_that.championId);case _:
  return null;

}
}

}

/// @nodoc


class _GameParticipant implements GameParticipant {
  const _GameParticipant({required this.puuid, this.isBot = false, required this.spellOne, required this.spellTwo, required this.riotId, required this.championId});
  

@override final  String? puuid;
@override@JsonKey() final  bool isBot;
@override final  SummonerSpell spellOne;
@override final  SummonerSpell spellTwo;
@override final  String riotId;
@override final  int championId;

/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameParticipantCopyWith<_GameParticipant> get copyWith => __$GameParticipantCopyWithImpl<_GameParticipant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameParticipant&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.isBot, isBot) || other.isBot == isBot)&&(identical(other.spellOne, spellOne) || other.spellOne == spellOne)&&(identical(other.spellTwo, spellTwo) || other.spellTwo == spellTwo)&&(identical(other.riotId, riotId) || other.riotId == riotId)&&(identical(other.championId, championId) || other.championId == championId));
}


@override
int get hashCode => Object.hash(runtimeType,puuid,isBot,spellOne,spellTwo,riotId,championId);

@override
String toString() {
  return 'GameParticipant(puuid: $puuid, isBot: $isBot, spellOne: $spellOne, spellTwo: $spellTwo, riotId: $riotId, championId: $championId)';
}


}

/// @nodoc
abstract mixin class _$GameParticipantCopyWith<$Res> implements $GameParticipantCopyWith<$Res> {
  factory _$GameParticipantCopyWith(_GameParticipant value, $Res Function(_GameParticipant) _then) = __$GameParticipantCopyWithImpl;
@override @useResult
$Res call({
 String? puuid, bool isBot, SummonerSpell spellOne, SummonerSpell spellTwo, String riotId, int championId
});


@override $SummonerSpellCopyWith<$Res> get spellOne;@override $SummonerSpellCopyWith<$Res> get spellTwo;

}
/// @nodoc
class __$GameParticipantCopyWithImpl<$Res>
    implements _$GameParticipantCopyWith<$Res> {
  __$GameParticipantCopyWithImpl(this._self, this._then);

  final _GameParticipant _self;
  final $Res Function(_GameParticipant) _then;

/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? puuid = freezed,Object? isBot = null,Object? spellOne = null,Object? spellTwo = null,Object? riotId = null,Object? championId = null,}) {
  return _then(_GameParticipant(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,isBot: null == isBot ? _self.isBot : isBot // ignore: cast_nullable_to_non_nullable
as bool,spellOne: null == spellOne ? _self.spellOne : spellOne // ignore: cast_nullable_to_non_nullable
as SummonerSpell,spellTwo: null == spellTwo ? _self.spellTwo : spellTwo // ignore: cast_nullable_to_non_nullable
as SummonerSpell,riotId: null == riotId ? _self.riotId : riotId // ignore: cast_nullable_to_non_nullable
as String,championId: null == championId ? _self.championId : championId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummonerSpellCopyWith<$Res> get spellOne {
  
  return $SummonerSpellCopyWith<$Res>(_self.spellOne, (value) {
    return _then(_self.copyWith(spellOne: value));
  });
}/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummonerSpellCopyWith<$Res> get spellTwo {
  
  return $SummonerSpellCopyWith<$Res>(_self.spellTwo, (value) {
    return _then(_self.copyWith(spellTwo: value));
  });
}
}

// dart format on
