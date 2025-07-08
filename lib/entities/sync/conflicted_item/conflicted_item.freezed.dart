// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conflicted_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConflictedItem _$ConflictedItemFromJson(Map<String, dynamic> json) {
  return _ConflictedItem.fromJson(json);
}

/// @nodoc
mixin _$ConflictedItem {
  ItemType get type => throw _privateConstructorUsedError;
  String get patchId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get remoteObject => throw _privateConstructorUsedError;

  /// Serializes this ConflictedItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConflictedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConflictedItemCopyWith<ConflictedItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConflictedItemCopyWith<$Res> {
  factory $ConflictedItemCopyWith(
          ConflictedItem value, $Res Function(ConflictedItem) then) =
      _$ConflictedItemCopyWithImpl<$Res, ConflictedItem>;
  @useResult
  $Res call(
      {ItemType type, String patchId, Map<String, dynamic>? remoteObject});
}

/// @nodoc
class _$ConflictedItemCopyWithImpl<$Res, $Val extends ConflictedItem>
    implements $ConflictedItemCopyWith<$Res> {
  _$ConflictedItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConflictedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? patchId = null,
    Object? remoteObject = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      patchId: null == patchId
          ? _value.patchId
          : patchId // ignore: cast_nullable_to_non_nullable
              as String,
      remoteObject: freezed == remoteObject
          ? _value.remoteObject
          : remoteObject // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConflictedItemImplCopyWith<$Res>
    implements $ConflictedItemCopyWith<$Res> {
  factory _$$ConflictedItemImplCopyWith(_$ConflictedItemImpl value,
          $Res Function(_$ConflictedItemImpl) then) =
      __$$ConflictedItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ItemType type, String patchId, Map<String, dynamic>? remoteObject});
}

/// @nodoc
class __$$ConflictedItemImplCopyWithImpl<$Res>
    extends _$ConflictedItemCopyWithImpl<$Res, _$ConflictedItemImpl>
    implements _$$ConflictedItemImplCopyWith<$Res> {
  __$$ConflictedItemImplCopyWithImpl(
      _$ConflictedItemImpl _value, $Res Function(_$ConflictedItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConflictedItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? patchId = null,
    Object? remoteObject = freezed,
  }) {
    return _then(_$ConflictedItemImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ItemType,
      patchId: null == patchId
          ? _value.patchId
          : patchId // ignore: cast_nullable_to_non_nullable
              as String,
      remoteObject: freezed == remoteObject
          ? _value._remoteObject
          : remoteObject // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConflictedItemImpl implements _ConflictedItem {
  const _$ConflictedItemImpl(
      {required this.type,
      required this.patchId,
      final Map<String, dynamic>? remoteObject})
      : _remoteObject = remoteObject;

  factory _$ConflictedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConflictedItemImplFromJson(json);

  @override
  final ItemType type;
  @override
  final String patchId;
  final Map<String, dynamic>? _remoteObject;
  @override
  Map<String, dynamic>? get remoteObject {
    final value = _remoteObject;
    if (value == null) return null;
    if (_remoteObject is EqualUnmodifiableMapView) return _remoteObject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ConflictedItem(type: $type, patchId: $patchId, remoteObject: $remoteObject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictedItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.patchId, patchId) || other.patchId == patchId) &&
            const DeepCollectionEquality()
                .equals(other._remoteObject, _remoteObject));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, patchId,
      const DeepCollectionEquality().hash(_remoteObject));

  /// Create a copy of ConflictedItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictedItemImplCopyWith<_$ConflictedItemImpl> get copyWith =>
      __$$ConflictedItemImplCopyWithImpl<_$ConflictedItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConflictedItemImplToJson(
      this,
    );
  }
}

abstract class _ConflictedItem implements ConflictedItem {
  const factory _ConflictedItem(
      {required final ItemType type,
      required final String patchId,
      final Map<String, dynamic>? remoteObject}) = _$ConflictedItemImpl;

  factory _ConflictedItem.fromJson(Map<String, dynamic> json) =
      _$ConflictedItemImpl.fromJson;

  @override
  ItemType get type;
  @override
  String get patchId;
  @override
  Map<String, dynamic>? get remoteObject;

  /// Create a copy of ConflictedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConflictedItemImplCopyWith<_$ConflictedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
