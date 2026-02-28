// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountModelRequest {

 String get name; String get tag;
/// Create a copy of AccountModelRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountModelRequestCopyWith<AccountModelRequest> get copyWith => _$AccountModelRequestCopyWithImpl<AccountModelRequest>(this as AccountModelRequest, _$identity);

  /// Serializes this AccountModelRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountModelRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,tag);

@override
String toString() {
  return 'AccountModelRequest(name: $name, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $AccountModelRequestCopyWith<$Res>  {
  factory $AccountModelRequestCopyWith(AccountModelRequest value, $Res Function(AccountModelRequest) _then) = _$AccountModelRequestCopyWithImpl;
@useResult
$Res call({
 String name, String tag
});




}
/// @nodoc
class _$AccountModelRequestCopyWithImpl<$Res>
    implements $AccountModelRequestCopyWith<$Res> {
  _$AccountModelRequestCopyWithImpl(this._self, this._then);

  final AccountModelRequest _self;
  final $Res Function(AccountModelRequest) _then;

/// Create a copy of AccountModelRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? tag = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountModelRequest].
extension AccountModelRequestPatterns on AccountModelRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountModelRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountModelRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountModelRequest value)  $default,){
final _that = this;
switch (_that) {
case _AccountModelRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountModelRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AccountModelRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String tag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountModelRequest() when $default != null:
return $default(_that.name,_that.tag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String tag)  $default,) {final _that = this;
switch (_that) {
case _AccountModelRequest():
return $default(_that.name,_that.tag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String tag)?  $default,) {final _that = this;
switch (_that) {
case _AccountModelRequest() when $default != null:
return $default(_that.name,_that.tag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountModelRequest implements AccountModelRequest {
  const _AccountModelRequest({required this.name, required this.tag});
  factory _AccountModelRequest.fromJson(Map<String, dynamic> json) => _$AccountModelRequestFromJson(json);

@override final  String name;
@override final  String tag;

/// Create a copy of AccountModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountModelRequestCopyWith<_AccountModelRequest> get copyWith => __$AccountModelRequestCopyWithImpl<_AccountModelRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountModelRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountModelRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.tag, tag) || other.tag == tag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,tag);

@override
String toString() {
  return 'AccountModelRequest(name: $name, tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$AccountModelRequestCopyWith<$Res> implements $AccountModelRequestCopyWith<$Res> {
  factory _$AccountModelRequestCopyWith(_AccountModelRequest value, $Res Function(_AccountModelRequest) _then) = __$AccountModelRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String tag
});




}
/// @nodoc
class __$AccountModelRequestCopyWithImpl<$Res>
    implements _$AccountModelRequestCopyWith<$Res> {
  __$AccountModelRequestCopyWithImpl(this._self, this._then);

  final _AccountModelRequest _self;
  final $Res Function(_AccountModelRequest) _then;

/// Create a copy of AccountModelRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? tag = null,}) {
  return _then(_AccountModelRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
