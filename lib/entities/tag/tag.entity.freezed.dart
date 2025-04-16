// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TagEntity _$TagEntityFromJson(Map<String, dynamic> json) {
  return _TagEntity.fromJson(json);
}

/// @nodoc
mixin _$TagEntity {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  set userId(String? value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  set color(String? value) => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  /// Serializes this TagEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagEntityCopyWith<TagEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagEntityCopyWith<$Res> {
  factory $TagEntityCopyWith(TagEntity value, $Res Function(TagEntity) then) =
      _$TagEntityCopyWithImpl<$Res, TagEntity>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String name,
      String? color,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TagEntityCopyWithImpl<$Res, $Val extends TagEntity>
    implements $TagEntityCopyWith<$Res> {
  _$TagEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = null,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagEntityImplCopyWith<$Res>
    implements $TagEntityCopyWith<$Res> {
  factory _$$TagEntityImplCopyWith(
          _$TagEntityImpl value, $Res Function(_$TagEntityImpl) then) =
      __$$TagEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      String name,
      String? color,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$TagEntityImplCopyWithImpl<$Res>
    extends _$TagEntityCopyWithImpl<$Res, _$TagEntityImpl>
    implements _$$TagEntityImplCopyWith<$Res> {
  __$$TagEntityImplCopyWithImpl(
      _$TagEntityImpl _value, $Res Function(_$TagEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? name = null,
    Object? color = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TagEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagEntityImpl extends _TagEntity {
  _$TagEntityImpl(
      {this.id,
      this.userId,
      required this.name,
      this.color,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$TagEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagEntityImplFromJson(json);

  @override
  String? id;
  @override
  String? userId;
  @override
  String name;
  @override
  String? color;
  @override
  DateTime? createdAt;
  @override
  DateTime? updatedAt;

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagEntityImplCopyWith<_$TagEntityImpl> get copyWith =>
      __$$TagEntityImplCopyWithImpl<_$TagEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagEntityImplToJson(
      this,
    );
  }
}

abstract class _TagEntity extends TagEntity {
  factory _TagEntity(
      {String? id,
      String? userId,
      required String name,
      String? color,
      DateTime? createdAt,
      DateTime? updatedAt}) = _$TagEntityImpl;
  _TagEntity._() : super._();

  factory _TagEntity.fromJson(Map<String, dynamic> json) =
      _$TagEntityImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get userId;
  set userId(String? value);
  @override
  String get name;
  set name(String value);
  @override
  String? get color;
  set color(String? value);
  @override
  DateTime? get createdAt;
  set createdAt(DateTime? value);
  @override
  DateTime? get updatedAt;
  set updatedAt(DateTime? value);

  /// Create a copy of TagEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagEntityImplCopyWith<_$TagEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
