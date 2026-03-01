// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 String? get nameField; String? get tagField; Account? get account; List<Account>? get savedAccounts; UiStatus get status;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.nameField, nameField) || other.nameField == nameField)&&(identical(other.tagField, tagField) || other.tagField == tagField)&&(identical(other.account, account) || other.account == account)&&const DeepCollectionEquality().equals(other.savedAccounts, savedAccounts)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,nameField,tagField,account,const DeepCollectionEquality().hash(savedAccounts),status);

@override
String toString() {
  return 'SearchState(nameField: $nameField, tagField: $tagField, account: $account, savedAccounts: $savedAccounts, status: $status)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String? nameField, String? tagField, Account? account, List<Account>? savedAccounts, UiStatus status
});


$AccountCopyWith<$Res>? get account;

}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nameField = freezed,Object? tagField = freezed,Object? account = freezed,Object? savedAccounts = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
nameField: freezed == nameField ? _self.nameField : nameField // ignore: cast_nullable_to_non_nullable
as String?,tagField: freezed == tagField ? _self.tagField : tagField // ignore: cast_nullable_to_non_nullable
as String?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account?,savedAccounts: freezed == savedAccounts ? _self.savedAccounts : savedAccounts // ignore: cast_nullable_to_non_nullable
as List<Account>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UiStatus,
  ));
}
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $AccountCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? nameField,  String? tagField,  Account? account,  List<Account>? savedAccounts,  UiStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.nameField,_that.tagField,_that.account,_that.savedAccounts,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? nameField,  String? tagField,  Account? account,  List<Account>? savedAccounts,  UiStatus status)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.nameField,_that.tagField,_that.account,_that.savedAccounts,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? nameField,  String? tagField,  Account? account,  List<Account>? savedAccounts,  UiStatus status)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.nameField,_that.tagField,_that.account,_that.savedAccounts,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState extends SearchState {
  const _SearchState({this.nameField, this.tagField, this.account, final  List<Account>? savedAccounts, required this.status}): _savedAccounts = savedAccounts,super._();
  

@override final  String? nameField;
@override final  String? tagField;
@override final  Account? account;
 final  List<Account>? _savedAccounts;
@override List<Account>? get savedAccounts {
  final value = _savedAccounts;
  if (value == null) return null;
  if (_savedAccounts is EqualUnmodifiableListView) return _savedAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  UiStatus status;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.nameField, nameField) || other.nameField == nameField)&&(identical(other.tagField, tagField) || other.tagField == tagField)&&(identical(other.account, account) || other.account == account)&&const DeepCollectionEquality().equals(other._savedAccounts, _savedAccounts)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,nameField,tagField,account,const DeepCollectionEquality().hash(_savedAccounts),status);

@override
String toString() {
  return 'SearchState(nameField: $nameField, tagField: $tagField, account: $account, savedAccounts: $savedAccounts, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String? nameField, String? tagField, Account? account, List<Account>? savedAccounts, UiStatus status
});


@override $AccountCopyWith<$Res>? get account;

}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nameField = freezed,Object? tagField = freezed,Object? account = freezed,Object? savedAccounts = freezed,Object? status = null,}) {
  return _then(_SearchState(
nameField: freezed == nameField ? _self.nameField : nameField // ignore: cast_nullable_to_non_nullable
as String?,tagField: freezed == tagField ? _self.tagField : tagField // ignore: cast_nullable_to_non_nullable
as String?,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as Account?,savedAccounts: freezed == savedAccounts ? _self._savedAccounts : savedAccounts // ignore: cast_nullable_to_non_nullable
as List<Account>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UiStatus,
  ));
}

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountCopyWith<$Res>? get account {
    if (_self.account == null) {
    return null;
  }

  return $AccountCopyWith<$Res>(_self.account!, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

// dart format on
