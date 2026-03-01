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

// dart format on
