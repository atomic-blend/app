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
  String get type => throw _privateConstructorUsedError;
  dynamic get oldItem => throw _privateConstructorUsedError;
  dynamic get newItem => throw _privateConstructorUsedError;

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
  $Res call({String type, dynamic oldItem, dynamic newItem});
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
    Object? oldItem = freezed,
    Object? newItem = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      oldItem: freezed == oldItem
          ? _value.oldItem
          : oldItem // ignore: cast_nullable_to_non_nullable
              as dynamic,
      newItem: freezed == newItem
          ? _value.newItem
          : newItem // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
  $Res call({String type, dynamic oldItem, dynamic newItem});
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
    Object? oldItem = freezed,
    Object? newItem = freezed,
  }) {
    return _then(_$ConflictedItemImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      oldItem: freezed == oldItem
          ? _value.oldItem
          : oldItem // ignore: cast_nullable_to_non_nullable
              as dynamic,
      newItem: freezed == newItem
          ? _value.newItem
          : newItem // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConflictedItemImpl implements _ConflictedItem {
  const _$ConflictedItemImpl({required this.type, this.oldItem, this.newItem});

  factory _$ConflictedItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConflictedItemImplFromJson(json);

  @override
  final String type;
  @override
  final dynamic oldItem;
  @override
  final dynamic newItem;

  @override
  String toString() {
    return 'ConflictedItem(type: $type, oldItem: $oldItem, newItem: $newItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictedItemImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.oldItem, oldItem) &&
            const DeepCollectionEquality().equals(other.newItem, newItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(oldItem),
      const DeepCollectionEquality().hash(newItem));

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
      {required final String type,
      final dynamic oldItem,
      final dynamic newItem}) = _$ConflictedItemImpl;

  factory _ConflictedItem.fromJson(Map<String, dynamic> json) =
      _$ConflictedItemImpl.fromJson;

  @override
  String get type;
  @override
  dynamic get oldItem;
  @override
  dynamic get newItem;

  /// Create a copy of ConflictedItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConflictedItemImplCopyWith<_$ConflictedItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
