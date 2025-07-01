// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Patch _$PatchFromJson(Map<String, dynamic> json) {
  return _Patch.fromJson(json);
}

/// @nodoc
mixin _$Patch {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  PatchAction get action => throw _privateConstructorUsedError;
  set action(PatchAction value) => throw _privateConstructorUsedError;
  DateTime get patchDate => throw _privateConstructorUsedError;
  set patchDate(DateTime value) => throw _privateConstructorUsedError;
  ItemType get type => throw _privateConstructorUsedError;
  set type(ItemType value) => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  set itemId(String value) => throw _privateConstructorUsedError;

  /// Serializes this Patch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Patch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchCopyWith<Patch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchCopyWith<$Res> {
  factory $PatchCopyWith(Patch value, $Res Function(Patch) then) =
      _$PatchCopyWithImpl<$Res, Patch>;
  @useResult
  $Res call(
      {String id,
      PatchAction action,
      DateTime patchDate,
      ItemType type,
      String itemId});
}

/// @nodoc
class _$PatchCopyWithImpl<$Res, $Val extends Patch>
    implements $PatchCopyWith<$Res> {
  _$PatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? patchDate = null,
    Object? type = null,
    Object? itemId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as PatchAction,
      patchDate: null == patchDate
          ? _value.patchDate
          : patchDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchImplCopyWith<$Res> implements $PatchCopyWith<$Res> {
  factory _$$PatchImplCopyWith(
          _$PatchImpl value, $Res Function(_$PatchImpl) then) =
      __$$PatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PatchAction action,
      DateTime patchDate,
      ItemType type,
      String itemId});
}

/// @nodoc
class __$$PatchImplCopyWithImpl<$Res>
    extends _$PatchCopyWithImpl<$Res, _$PatchImpl>
    implements _$$PatchImplCopyWith<$Res> {
  __$$PatchImplCopyWithImpl(
      _$PatchImpl _value, $Res Function(_$PatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Patch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? patchDate = null,
    Object? type = null,
    Object? itemId = null,
  }) {
    return _then(_$PatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as PatchAction,
      patchDate: null == patchDate
          ? _value.patchDate
          : patchDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchImpl implements _Patch {
  const _$PatchImpl(
      {required this.id,
      required this.action,
      required this.patchDate,
      required this.type,
      required this.itemId});

  factory _$PatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchImplFromJson(json);

  @override
  String id;
  @override
  PatchAction action;
  @override
  DateTime patchDate;
  @override
  ItemType type;
  @override
  String itemId;

  @override
  String toString() {
    return 'Patch(id: $id, action: $action, patchDate: $patchDate, type: $type, itemId: $itemId)';
  }

  /// Create a copy of Patch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchImplCopyWith<_$PatchImpl> get copyWith =>
      __$$PatchImplCopyWithImpl<_$PatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchImplToJson(
      this,
    );
  }
}

abstract class _Patch implements Patch {
  const factory _Patch(
      {required String id,
      required PatchAction action,
      required DateTime patchDate,
      required ItemType type,
      required String itemId}) = _$PatchImpl;

  factory _Patch.fromJson(Map<String, dynamic> json) = _$PatchImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  PatchAction get action;
  set action(PatchAction value);
  @override
  DateTime get patchDate;
  set patchDate(DateTime value);
  @override
  ItemType get type;
  set type(ItemType value);
  @override
  String get itemId;
  set itemId(String value);

  /// Create a copy of Patch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchImplCopyWith<_$PatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
