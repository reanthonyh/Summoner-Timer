// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameInformation {

 String? get matchId; List<GameParticipant> get players;
/// Create a copy of GameInformation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameInformationCopyWith<GameInformation> get copyWith => _$GameInformationCopyWithImpl<GameInformation>(this as GameInformation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameInformation&&(identical(other.matchId, matchId) || other.matchId == matchId)&&const DeepCollectionEquality().equals(other.players, players));
}


@override
int get hashCode => Object.hash(runtimeType,matchId,const DeepCollectionEquality().hash(players));

@override
String toString() {
  return 'GameInformation(matchId: $matchId, players: $players)';
}


}

/// @nodoc
abstract mixin class $GameInformationCopyWith<$Res>  {
  factory $GameInformationCopyWith(GameInformation value, $Res Function(GameInformation) _then) = _$GameInformationCopyWithImpl;
@useResult
$Res call({
 String? matchId, List<GameParticipant> players
});




}
/// @nodoc
class _$GameInformationCopyWithImpl<$Res>
    implements $GameInformationCopyWith<$Res> {
  _$GameInformationCopyWithImpl(this._self, this._then);

  final GameInformation _self;
  final $Res Function(GameInformation) _then;

/// Create a copy of GameInformation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchId = freezed,Object? players = null,}) {
  return _then(_self.copyWith(
matchId: freezed == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String?,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<GameParticipant>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameInformation].
extension GameInformationPatterns on GameInformation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameInformation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameInformation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameInformation value)  $default,){
final _that = this;
switch (_that) {
case _GameInformation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameInformation value)?  $default,){
final _that = this;
switch (_that) {
case _GameInformation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? matchId,  List<GameParticipant> players)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameInformation() when $default != null:
return $default(_that.matchId,_that.players);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? matchId,  List<GameParticipant> players)  $default,) {final _that = this;
switch (_that) {
case _GameInformation():
return $default(_that.matchId,_that.players);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? matchId,  List<GameParticipant> players)?  $default,) {final _that = this;
switch (_that) {
case _GameInformation() when $default != null:
return $default(_that.matchId,_that.players);case _:
  return null;

}
}

}

/// @nodoc


class _GameInformation implements GameInformation {
  const _GameInformation({required this.matchId, required final  List<GameParticipant> players}): _players = players;
  

@override final  String? matchId;
 final  List<GameParticipant> _players;
@override List<GameParticipant> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}


/// Create a copy of GameInformation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameInformationCopyWith<_GameInformation> get copyWith => __$GameInformationCopyWithImpl<_GameInformation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameInformation&&(identical(other.matchId, matchId) || other.matchId == matchId)&&const DeepCollectionEquality().equals(other._players, _players));
}


@override
int get hashCode => Object.hash(runtimeType,matchId,const DeepCollectionEquality().hash(_players));

@override
String toString() {
  return 'GameInformation(matchId: $matchId, players: $players)';
}


}

/// @nodoc
abstract mixin class _$GameInformationCopyWith<$Res> implements $GameInformationCopyWith<$Res> {
  factory _$GameInformationCopyWith(_GameInformation value, $Res Function(_GameInformation) _then) = __$GameInformationCopyWithImpl;
@override @useResult
$Res call({
 String? matchId, List<GameParticipant> players
});




}
/// @nodoc
class __$GameInformationCopyWithImpl<$Res>
    implements _$GameInformationCopyWith<$Res> {
  __$GameInformationCopyWithImpl(this._self, this._then);

  final _GameInformation _self;
  final $Res Function(_GameInformation) _then;

/// Create a copy of GameInformation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchId = freezed,Object? players = null,}) {
  return _then(_GameInformation(
matchId: freezed == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as String?,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<GameParticipant>,
  ));
}


}

/// @nodoc
mixin _$GameParticipant {

 String? get puuid; bool get isBot; SummonerSpell get spellOne; SummonerSpell get spellTwo;
/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameParticipantCopyWith<GameParticipant> get copyWith => _$GameParticipantCopyWithImpl<GameParticipant>(this as GameParticipant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameParticipant&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.isBot, isBot) || other.isBot == isBot)&&(identical(other.spellOne, spellOne) || other.spellOne == spellOne)&&(identical(other.spellTwo, spellTwo) || other.spellTwo == spellTwo));
}


@override
int get hashCode => Object.hash(runtimeType,puuid,isBot,spellOne,spellTwo);

@override
String toString() {
  return 'GameParticipant(puuid: $puuid, isBot: $isBot, spellOne: $spellOne, spellTwo: $spellTwo)';
}


}

/// @nodoc
abstract mixin class $GameParticipantCopyWith<$Res>  {
  factory $GameParticipantCopyWith(GameParticipant value, $Res Function(GameParticipant) _then) = _$GameParticipantCopyWithImpl;
@useResult
$Res call({
 String? puuid, bool isBot, SummonerSpell spellOne, SummonerSpell spellTwo
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
@pragma('vm:prefer-inline') @override $Res call({Object? puuid = freezed,Object? isBot = null,Object? spellOne = null,Object? spellTwo = null,}) {
  return _then(_self.copyWith(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,isBot: null == isBot ? _self.isBot : isBot // ignore: cast_nullable_to_non_nullable
as bool,spellOne: null == spellOne ? _self.spellOne : spellOne // ignore: cast_nullable_to_non_nullable
as SummonerSpell,spellTwo: null == spellTwo ? _self.spellTwo : spellTwo // ignore: cast_nullable_to_non_nullable
as SummonerSpell,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? puuid,  bool isBot,  SummonerSpell spellOne,  SummonerSpell spellTwo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameParticipant() when $default != null:
return $default(_that.puuid,_that.isBot,_that.spellOne,_that.spellTwo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? puuid,  bool isBot,  SummonerSpell spellOne,  SummonerSpell spellTwo)  $default,) {final _that = this;
switch (_that) {
case _GameParticipant():
return $default(_that.puuid,_that.isBot,_that.spellOne,_that.spellTwo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? puuid,  bool isBot,  SummonerSpell spellOne,  SummonerSpell spellTwo)?  $default,) {final _that = this;
switch (_that) {
case _GameParticipant() when $default != null:
return $default(_that.puuid,_that.isBot,_that.spellOne,_that.spellTwo);case _:
  return null;

}
}

}

/// @nodoc


class _GameParticipant implements GameParticipant {
  const _GameParticipant({required this.puuid, this.isBot = false, required this.spellOne, required this.spellTwo});
  

@override final  String? puuid;
@override@JsonKey() final  bool isBot;
@override final  SummonerSpell spellOne;
@override final  SummonerSpell spellTwo;

/// Create a copy of GameParticipant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameParticipantCopyWith<_GameParticipant> get copyWith => __$GameParticipantCopyWithImpl<_GameParticipant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameParticipant&&(identical(other.puuid, puuid) || other.puuid == puuid)&&(identical(other.isBot, isBot) || other.isBot == isBot)&&(identical(other.spellOne, spellOne) || other.spellOne == spellOne)&&(identical(other.spellTwo, spellTwo) || other.spellTwo == spellTwo));
}


@override
int get hashCode => Object.hash(runtimeType,puuid,isBot,spellOne,spellTwo);

@override
String toString() {
  return 'GameParticipant(puuid: $puuid, isBot: $isBot, spellOne: $spellOne, spellTwo: $spellTwo)';
}


}

/// @nodoc
abstract mixin class _$GameParticipantCopyWith<$Res> implements $GameParticipantCopyWith<$Res> {
  factory _$GameParticipantCopyWith(_GameParticipant value, $Res Function(_GameParticipant) _then) = __$GameParticipantCopyWithImpl;
@override @useResult
$Res call({
 String? puuid, bool isBot, SummonerSpell spellOne, SummonerSpell spellTwo
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
@override @pragma('vm:prefer-inline') $Res call({Object? puuid = freezed,Object? isBot = null,Object? spellOne = null,Object? spellTwo = null,}) {
  return _then(_GameParticipant(
puuid: freezed == puuid ? _self.puuid : puuid // ignore: cast_nullable_to_non_nullable
as String?,isBot: null == isBot ? _self.isBot : isBot // ignore: cast_nullable_to_non_nullable
as bool,spellOne: null == spellOne ? _self.spellOne : spellOne // ignore: cast_nullable_to_non_nullable
as SummonerSpell,spellTwo: null == spellTwo ? _self.spellTwo : spellTwo // ignore: cast_nullable_to_non_nullable
as SummonerSpell,
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

/// @nodoc
mixin _$SummonerSpell {

 String get id; String get name; int get cooldownSeconds;
/// Create a copy of SummonerSpell
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummonerSpellCopyWith<SummonerSpell> get copyWith => _$SummonerSpellCopyWithImpl<SummonerSpell>(this as SummonerSpell, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummonerSpell&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,cooldownSeconds);

@override
String toString() {
  return 'SummonerSpell(id: $id, name: $name, cooldownSeconds: $cooldownSeconds)';
}


}

/// @nodoc
abstract mixin class $SummonerSpellCopyWith<$Res>  {
  factory $SummonerSpellCopyWith(SummonerSpell value, $Res Function(SummonerSpell) _then) = _$SummonerSpellCopyWithImpl;
@useResult
$Res call({
 String id, String name, int cooldownSeconds
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cooldownSeconds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int cooldownSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummonerSpell() when $default != null:
return $default(_that.id,_that.name,_that.cooldownSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int cooldownSeconds)  $default,) {final _that = this;
switch (_that) {
case _SummonerSpell():
return $default(_that.id,_that.name,_that.cooldownSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int cooldownSeconds)?  $default,) {final _that = this;
switch (_that) {
case _SummonerSpell() when $default != null:
return $default(_that.id,_that.name,_that.cooldownSeconds);case _:
  return null;

}
}

}

/// @nodoc


class _SummonerSpell implements SummonerSpell {
  const _SummonerSpell({required this.id, required this.name, required this.cooldownSeconds});
  

@override final  String id;
@override final  String name;
@override final  int cooldownSeconds;

/// Create a copy of SummonerSpell
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummonerSpellCopyWith<_SummonerSpell> get copyWith => __$SummonerSpellCopyWithImpl<_SummonerSpell>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummonerSpell&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,cooldownSeconds);

@override
String toString() {
  return 'SummonerSpell(id: $id, name: $name, cooldownSeconds: $cooldownSeconds)';
}


}

/// @nodoc
abstract mixin class _$SummonerSpellCopyWith<$Res> implements $SummonerSpellCopyWith<$Res> {
  factory _$SummonerSpellCopyWith(_SummonerSpell value, $Res Function(_SummonerSpell) _then) = __$SummonerSpellCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int cooldownSeconds
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cooldownSeconds = null,}) {
  return _then(_SummonerSpell(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
