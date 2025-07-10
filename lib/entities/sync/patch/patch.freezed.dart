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
  @Iso8601DateTimeConverter()
  DateTime get patchDate => throw _privateConstructorUsedError;
  @Iso8601DateTimeConverter()
  set patchDate(DateTime value) => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  set itemType(ItemType value) => throw _privateConstructorUsedError;
  String get itemId => throw _privateConstructorUsedError;
  set itemId(String value) => throw _privateConstructorUsedError;
  List<PatchChange> get changes => throw _privateConstructorUsedError;
  set changes(List<PatchChange> value) => throw _privateConstructorUsedError;
  bool? get force => throw _privateConstructorUsedError;
  set force(bool? value) => throw _privateConstructorUsedError;

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
      @Iso8601DateTimeConverter() DateTime patchDate,
      ItemType itemType,
      String itemId,
      List<PatchChange> changes,
      bool? force});
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
    Object? itemType = null,
    Object? itemId = null,
    Object? changes = null,
    Object? force = freezed,
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
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      changes: null == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<PatchChange>,
      force: freezed == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      @Iso8601DateTimeConverter() DateTime patchDate,
      ItemType itemType,
      String itemId,
      List<PatchChange> changes,
      bool? force});
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
    Object? itemType = null,
    Object? itemId = null,
    Object? changes = null,
    Object? force = freezed,
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
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      changes: null == changes
          ? _value.changes
          : changes // ignore: cast_nullable_to_non_nullable
              as List<PatchChange>,
      force: freezed == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchImpl implements _Patch {
  _$PatchImpl(
      {required this.id,
      required this.action,
      @Iso8601DateTimeConverter() required this.patchDate,
      required this.itemType,
      required this.itemId,
      required this.changes,
      this.force});

  factory _$PatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchImplFromJson(json);

  @override
  String id;
  @override
  PatchAction action;
  @override
  @Iso8601DateTimeConverter()
  DateTime patchDate;
  @override
  ItemType itemType;
  @override
  String itemId;
  @override
  List<PatchChange> changes;
  @override
  bool? force;

  @override
  String toString() {
    return 'Patch(id: $id, action: $action, patchDate: $patchDate, itemType: $itemType, itemId: $itemId, changes: $changes, force: $force)';
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
  factory _Patch(
      {required String id,
      required PatchAction action,
      @Iso8601DateTimeConverter() required DateTime patchDate,
      required ItemType itemType,
      required String itemId,
      required List<PatchChange> changes,
      bool? force}) = _$PatchImpl;

  factory _Patch.fromJson(Map<String, dynamic> json) = _$PatchImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  PatchAction get action;
  set action(PatchAction value);
  @override
  @Iso8601DateTimeConverter()
  DateTime get patchDate;
  @Iso8601DateTimeConverter()
  set patchDate(DateTime value);
  @override
  ItemType get itemType;
  set itemType(ItemType value);
  @override
  String get itemId;
  set itemId(String value);
  @override
  List<PatchChange> get changes;
  set changes(List<PatchChange> value);
  @override
  bool? get force;
  set force(bool? value);

  /// Create a copy of Patch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchImplCopyWith<_$PatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
