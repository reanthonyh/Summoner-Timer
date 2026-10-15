// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summoner_spell_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SummonerSpellModel {

 String? get id; String? get name; String? get description; List<int>? get cooldown; String? get key; SummonerSpellImageModel? get image; List<String>? get modes;
/// Create a copy of SummonerSpellModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummonerSpellModelCopyWith<SummonerSpellModel> get copyWith => _$SummonerSpellModelCopyWithImpl<SummonerSpellModel>(this as SummonerSpellModel, _$identity);

  /// Serializes this SummonerSpellModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SummonerSpellModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummonerSpellModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.description, _this.description) || other.description == _this.description)&&const DeepCollectionEquality().equals(other.cooldown, _this.cooldown)&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.image, _this.image) || other.image == _this.image)&&const DeepCollectionEquality().equals(other.modes, _this.modes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SummonerSpellModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.description,const DeepCollectionEquality().hash(_this.cooldown),_this.key,_this.image,const DeepCollectionEquality().hash(_this.modes));
}

@override
String toString() {
  final _this = this as SummonerSpellModel;
  return 'SummonerSpellModel(id: ${_this.id}, name: ${_this.name}, description: ${_this.description}, cooldown: ${_this.cooldown}, key: ${_this.key}, image: ${_this.image}, modes: ${_this.modes})';
}


}

/// @nodoc
abstract mixin class $SummonerSpellModelCopyWith<$Res>  {
  factory $SummonerSpellModelCopyWith(SummonerSpellModel value, $Res Function(SummonerSpellModel) _then) = _$SummonerSpellModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? description, List<int>? cooldown, String? key, SummonerSpellImageModel? image, List<String>? modes
});


$SummonerSpellImageModelCopyWith<$Res>? get image;

}
/// @nodoc
class _$SummonerSpellModelCopyWithImpl<$Res>
    implements $SummonerSpellModelCopyWith<$Res> {
  _$SummonerSpellModelCopyWithImpl(this._self, this._then);

  final SummonerSpellModel _self;
  final $Res Function(SummonerSpellModel) _then;

/// Create a copy of SummonerSpellModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? cooldown = freezed,Object? key = freezed,Object? image = freezed,Object? modes = freezed,}) {
  return _then(SummonerSpellModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cooldown: freezed == cooldown ? _self.cooldown : cooldown // ignore: cast_nullable_to_non_nullable
as List<int>?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as SummonerSpellImageModel?,modes: freezed == modes ? _self.modes : modes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of SummonerSpellModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummonerSpellImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $SummonerSpellImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}


/// Adds pattern-matching-related methods to [SummonerSpellModel].
extension SummonerSpellModelPatterns on SummonerSpellModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummonerSpellModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummonerSpellModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummonerSpellModel value)  $default,){
final _that = this;
switch (_that) {
case _SummonerSpellModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummonerSpellModel value)?  $default,){
final _that = this;
switch (_that) {
case _SummonerSpellModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description,  List<int>? cooldown,  String? key,  SummonerSpellImageModel? image,  List<String>? modes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummonerSpellModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.cooldown,_that.key,_that.image,_that.modes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description,  List<int>? cooldown,  String? key,  SummonerSpellImageModel? image,  List<String>? modes)  $default,) {final _that = this;
switch (_that) {
case _SummonerSpellModel():
return $default(_that.id,_that.name,_that.description,_that.cooldown,_that.key,_that.image,_that.modes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? description,  List<int>? cooldown,  String? key,  SummonerSpellImageModel? image,  List<String>? modes)?  $default,) {final _that = this;
switch (_that) {
case _SummonerSpellModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.cooldown,_that.key,_that.image,_that.modes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummonerSpellModel implements SummonerSpellModel {
  const _SummonerSpellModel({this.id, this.name, this.description,  List<int>? cooldown, this.key, this.image,  List<String>? modes}): _cooldown = cooldown,_modes = modes;
  factory _SummonerSpellModel.fromJson(Map<String, dynamic> json) => _$SummonerSpellModelFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? description;
 final  List<int>? _cooldown;
@override List<int>? get cooldown {
  final value = _cooldown;
  if (value == null) return null;
  if (_cooldown is EqualUnmodifiableListView) return _cooldown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? key;
@override final  SummonerSpellImageModel? image;
 final  List<String>? _modes;
@override List<String>? get modes {
  final value = _modes;
  if (value == null) return null;
  if (_modes is EqualUnmodifiableListView) return _modes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SummonerSpellModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummonerSpellModelCopyWith<_SummonerSpellModel> get copyWith => __$SummonerSpellModelCopyWithImpl<_SummonerSpellModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummonerSpellModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummonerSpellModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.cooldown, _cooldown)&&(identical(other.key, key) || other.key == key)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.modes, _modes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_cooldown),key,image,const DeepCollectionEquality().hash(_modes));
}

@override
String toString() {
    return 'SummonerSpellModel(id: $id, name: $name, description: $description, cooldown: $cooldown, key: $key, image: $image, modes: $modes)';
}


}

/// @nodoc
abstract mixin class _$SummonerSpellModelCopyWith<$Res> implements $SummonerSpellModelCopyWith<$Res> {
  factory _$SummonerSpellModelCopyWith(_SummonerSpellModel value, $Res Function(_SummonerSpellModel) _then) = __$SummonerSpellModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? description, List<int>? cooldown, String? key, SummonerSpellImageModel? image, List<String>? modes
});


@override $SummonerSpellImageModelCopyWith<$Res>? get image;

}
/// @nodoc
class __$SummonerSpellModelCopyWithImpl<$Res>
    implements _$SummonerSpellModelCopyWith<$Res> {
  __$SummonerSpellModelCopyWithImpl(this._self, this._then);

  final _SummonerSpellModel _self;
  final $Res Function(_SummonerSpellModel) _then;

/// Create a copy of SummonerSpellModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? cooldown = freezed,Object? key = freezed,Object? image = freezed,Object? modes = freezed,}) {
  return _then(_SummonerSpellModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,cooldown: freezed == cooldown ? _self._cooldown : cooldown // ignore: cast_nullable_to_non_nullable
as List<int>?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as SummonerSpellImageModel?,modes: freezed == modes ? _self._modes : modes // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of SummonerSpellModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SummonerSpellImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $SummonerSpellImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}
}

// dart format on
