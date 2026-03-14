// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_accounts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecentAccountsState {

 List<Account> get recentAccounts; UiStatus get status; String? get message;
/// Create a copy of RecentAccountsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentAccountsStateCopyWith<RecentAccountsState> get copyWith => _$RecentAccountsStateCopyWithImpl<RecentAccountsState>(this as RecentAccountsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentAccountsState&&const DeepCollectionEquality().equals(other.recentAccounts, recentAccounts)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recentAccounts),status,message);

@override
String toString() {
  return 'RecentAccountsState(recentAccounts: $recentAccounts, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $RecentAccountsStateCopyWith<$Res>  {
  factory $RecentAccountsStateCopyWith(RecentAccountsState value, $Res Function(RecentAccountsState) _then) = _$RecentAccountsStateCopyWithImpl;
@useResult
$Res call({
 List<Account> recentAccounts, UiStatus status, String? message
});




}
/// @nodoc
class _$RecentAccountsStateCopyWithImpl<$Res>
    implements $RecentAccountsStateCopyWith<$Res> {
  _$RecentAccountsStateCopyWithImpl(this._self, this._then);

  final RecentAccountsState _self;
  final $Res Function(RecentAccountsState) _then;

/// Create a copy of RecentAccountsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recentAccounts = null,Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
recentAccounts: null == recentAccounts ? _self.recentAccounts : recentAccounts // ignore: cast_nullable_to_non_nullable
as List<Account>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UiStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecentAccountsState].
extension RecentAccountsStatePatterns on RecentAccountsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentAccountsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentAccountsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentAccountsState value)  $default,){
final _that = this;
switch (_that) {
case _RecentAccountsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentAccountsState value)?  $default,){
final _that = this;
switch (_that) {
case _RecentAccountsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Account> recentAccounts,  UiStatus status,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentAccountsState() when $default != null:
return $default(_that.recentAccounts,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Account> recentAccounts,  UiStatus status,  String? message)  $default,) {final _that = this;
switch (_that) {
case _RecentAccountsState():
return $default(_that.recentAccounts,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Account> recentAccounts,  UiStatus status,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _RecentAccountsState() when $default != null:
return $default(_that.recentAccounts,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _RecentAccountsState implements RecentAccountsState {
  const _RecentAccountsState({final  List<Account> recentAccounts = const [], required this.status, this.message}): _recentAccounts = recentAccounts;
  

 final  List<Account> _recentAccounts;
@override@JsonKey() List<Account> get recentAccounts {
  if (_recentAccounts is EqualUnmodifiableListView) return _recentAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentAccounts);
}

@override final  UiStatus status;
@override final  String? message;

/// Create a copy of RecentAccountsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentAccountsStateCopyWith<_RecentAccountsState> get copyWith => __$RecentAccountsStateCopyWithImpl<_RecentAccountsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentAccountsState&&const DeepCollectionEquality().equals(other._recentAccounts, _recentAccounts)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recentAccounts),status,message);

@override
String toString() {
  return 'RecentAccountsState(recentAccounts: $recentAccounts, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$RecentAccountsStateCopyWith<$Res> implements $RecentAccountsStateCopyWith<$Res> {
  factory _$RecentAccountsStateCopyWith(_RecentAccountsState value, $Res Function(_RecentAccountsState) _then) = __$RecentAccountsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Account> recentAccounts, UiStatus status, String? message
});




}
/// @nodoc
class __$RecentAccountsStateCopyWithImpl<$Res>
    implements _$RecentAccountsStateCopyWith<$Res> {
  __$RecentAccountsStateCopyWithImpl(this._self, this._then);

  final _RecentAccountsState _self;
  final $Res Function(_RecentAccountsState) _then;

/// Create a copy of RecentAccountsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recentAccounts = null,Object? status = null,Object? message = freezed,}) {
  return _then(_RecentAccountsState(
recentAccounts: null == recentAccounts ? _self._recentAccounts : recentAccounts // ignore: cast_nullable_to_non_nullable
as List<Account>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UiStatus,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
