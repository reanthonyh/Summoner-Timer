// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_match_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameMatchModelResponse {

 int? get gameId; int? get mapId; String? get gameMode; String? get gameType; List<ParticipantModel>? get participants; String? get platformId;
/// Create a copy of GameMatchModelResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameMatchModelResponseCopyWith<GameMatchModelResponse> get copyWith => _$GameMatchModelResponseCopyWithImpl<GameMatchModelResponse>(this as GameMatchModelResponse, _$identity);

  /// Serializes this GameMatchModelResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameMatchModelResponse&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.mapId, mapId) || other.mapId == mapId)&&(identical(other.gameMode, gameMode) || other.gameMode == gameMode)&&(identical(other.gameType, gameType) || other.gameType == gameType)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.platformId, platformId) || other.platformId == platformId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,mapId,gameMode,gameType,const DeepCollectionEquality().hash(participants),platformId);

@override
String toString() {
  return 'GameMatchModelResponse(gameId: $gameId, mapId: $mapId, gameMode: $gameMode, gameType: $gameType, participants: $participants, platformId: $platformId)';
}


}

/// @nodoc
abstract mixin class $GameMatchModelResponseCopyWith<$Res>  {
  factory $GameMatchModelResponseCopyWith(GameMatchModelResponse value, $Res Function(GameMatchModelResponse) _then) = _$GameMatchModelResponseCopyWithImpl;
@useResult
$Res call({
 int? gameId, int? mapId, String? gameMode, String? gameType, List<ParticipantModel>? participants, String? platformId
});




}
/// @nodoc
class _$GameMatchModelResponseCopyWithImpl<$Res>
    implements $GameMatchModelResponseCopyWith<$Res> {
  _$GameMatchModelResponseCopyWithImpl(this._self, this._then);

  final GameMatchModelResponse _self;
  final $Res Function(GameMatchModelResponse) _then;

/// Create a copy of GameMatchModelResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameId = freezed,Object? mapId = freezed,Object? gameMode = freezed,Object? gameType = freezed,Object? participants = freezed,Object? platformId = freezed,}) {
  return _then(_self.copyWith(
gameId: freezed == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int?,mapId: freezed == mapId ? _self.mapId : mapId // ignore: cast_nullable_to_non_nullable
as int?,gameMode: freezed == gameMode ? _self.gameMode : gameMode // ignore: cast_nullable_to_non_nullable
as String?,gameType: freezed == gameType ? _self.gameType : gameType // ignore: cast_nullable_to_non_nullable
as String?,participants: freezed == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantModel>?,platformId: freezed == platformId ? _self.platformId : platformId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GameMatchModelResponse].
extension GameMatchModelResponsePatterns on GameMatchModelResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameMatchModelResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameMatchModelResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameMatchModelResponse value)  $default,){
final _that = this;
switch (_that) {
case _GameMatchModelResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameMatchModelResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GameMatchModelResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? gameId,  int? mapId,  String? gameMode,  String? gameType,  List<ParticipantModel>? participants,  String? platformId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameMatchModelResponse() when $default != null:
return $default(_that.gameId,_that.mapId,_that.gameMode,_that.gameType,_that.participants,_that.platformId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? gameId,  int? mapId,  String? gameMode,  String? gameType,  List<ParticipantModel>? participants,  String? platformId)  $default,) {final _that = this;
switch (_that) {
case _GameMatchModelResponse():
return $default(_that.gameId,_that.mapId,_that.gameMode,_that.gameType,_that.participants,_that.platformId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? gameId,  int? mapId,  String? gameMode,  String? gameType,  List<ParticipantModel>? participants,  String? platformId)?  $default,) {final _that = this;
switch (_that) {
case _GameMatchModelResponse() when $default != null:
return $default(_that.gameId,_that.mapId,_that.gameMode,_that.gameType,_that.participants,_that.platformId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameMatchModelResponse implements GameMatchModelResponse {
  const _GameMatchModelResponse({this.gameId, this.mapId, this.gameMode, this.gameType, final  List<ParticipantModel>? participants, this.platformId}): _participants = participants;
  factory _GameMatchModelResponse.fromJson(Map<String, dynamic> json) => _$GameMatchModelResponseFromJson(json);

@override final  int? gameId;
@override final  int? mapId;
@override final  String? gameMode;
@override final  String? gameType;
 final  List<ParticipantModel>? _participants;
@override List<ParticipantModel>? get participants {
  final value = _participants;
  if (value == null) return null;
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? platformId;

/// Create a copy of GameMatchModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameMatchModelResponseCopyWith<_GameMatchModelResponse> get copyWith => __$GameMatchModelResponseCopyWithImpl<_GameMatchModelResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameMatchModelResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameMatchModelResponse&&(identical(other.gameId, gameId) || other.gameId == gameId)&&(identical(other.mapId, mapId) || other.mapId == mapId)&&(identical(other.gameMode, gameMode) || other.gameMode == gameMode)&&(identical(other.gameType, gameType) || other.gameType == gameType)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.platformId, platformId) || other.platformId == platformId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameId,mapId,gameMode,gameType,const DeepCollectionEquality().hash(_participants),platformId);

@override
String toString() {
  return 'GameMatchModelResponse(gameId: $gameId, mapId: $mapId, gameMode: $gameMode, gameType: $gameType, participants: $participants, platformId: $platformId)';
}


}

/// @nodoc
abstract mixin class _$GameMatchModelResponseCopyWith<$Res> implements $GameMatchModelResponseCopyWith<$Res> {
  factory _$GameMatchModelResponseCopyWith(_GameMatchModelResponse value, $Res Function(_GameMatchModelResponse) _then) = __$GameMatchModelResponseCopyWithImpl;
@override @useResult
$Res call({
 int? gameId, int? mapId, String? gameMode, String? gameType, List<ParticipantModel>? participants, String? platformId
});




}
/// @nodoc
class __$GameMatchModelResponseCopyWithImpl<$Res>
    implements _$GameMatchModelResponseCopyWith<$Res> {
  __$GameMatchModelResponseCopyWithImpl(this._self, this._then);

  final _GameMatchModelResponse _self;
  final $Res Function(_GameMatchModelResponse) _then;

/// Create a copy of GameMatchModelResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameId = freezed,Object? mapId = freezed,Object? gameMode = freezed,Object? gameType = freezed,Object? participants = freezed,Object? platformId = freezed,}) {
  return _then(_GameMatchModelResponse(
gameId: freezed == gameId ? _self.gameId : gameId // ignore: cast_nullable_to_non_nullable
as int?,mapId: freezed == mapId ? _self.mapId : mapId // ignore: cast_nullable_to_non_nullable
as int?,gameMode: freezed == gameMode ? _self.gameMode : gameMode // ignore: cast_nullable_to_non_nullable
as String?,gameType: freezed == gameType ? _self.gameType : gameType // ignore: cast_nullable_to_non_nullable
as String?,participants: freezed == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<ParticipantModel>?,platformId: freezed == platformId ? _self.platformId : platformId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
