// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceCalendar _$DeviceCalendarFromJson(Map<String, dynamic> json) {
  return _DeviceCalendar.fromJson(json);
}

/// @nodoc
mixin _$DeviceCalendar {
  Calendar get calendar => throw _privateConstructorUsedError;
  set calendar(Calendar value) => throw _privateConstructorUsedError;
  List<Event> get events => throw _privateConstructorUsedError;
  set events(List<Event> value) => throw _privateConstructorUsedError;

  /// Serializes this DeviceCalendar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceCalendarCopyWith<DeviceCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCalendarCopyWith<$Res> {
  factory $DeviceCalendarCopyWith(
          DeviceCalendar value, $Res Function(DeviceCalendar) then) =
      _$DeviceCalendarCopyWithImpl<$Res, DeviceCalendar>;
  @useResult
  $Res call({Calendar calendar, List<Event> events});
}

/// @nodoc
class _$DeviceCalendarCopyWithImpl<$Res, $Val extends DeviceCalendar>
    implements $DeviceCalendarCopyWith<$Res> {
  _$DeviceCalendarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendar = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as Calendar,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceCalendarImplCopyWith<$Res>
    implements $DeviceCalendarCopyWith<$Res> {
  factory _$$DeviceCalendarImplCopyWith(_$DeviceCalendarImpl value,
          $Res Function(_$DeviceCalendarImpl) then) =
      __$$DeviceCalendarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Calendar calendar, List<Event> events});
}

/// @nodoc
class __$$DeviceCalendarImplCopyWithImpl<$Res>
    extends _$DeviceCalendarCopyWithImpl<$Res, _$DeviceCalendarImpl>
    implements _$$DeviceCalendarImplCopyWith<$Res> {
  __$$DeviceCalendarImplCopyWithImpl(
      _$DeviceCalendarImpl _value, $Res Function(_$DeviceCalendarImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceCalendar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calendar = null,
    Object? events = null,
  }) {
    return _then(_$DeviceCalendarImpl(
      calendar: null == calendar
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as Calendar,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceCalendarImpl extends _DeviceCalendar {
  _$DeviceCalendarImpl({required this.calendar, required this.events})
      : super._();

  factory _$DeviceCalendarImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceCalendarImplFromJson(json);

  @override
  Calendar calendar;
  @override
  List<Event> events;

  @override
  String toString() {
    return 'DeviceCalendar(calendar: $calendar, events: $events)';
  }

  /// Create a copy of DeviceCalendar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceCalendarImplCopyWith<_$DeviceCalendarImpl> get copyWith =>
      __$$DeviceCalendarImplCopyWithImpl<_$DeviceCalendarImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceCalendarImplToJson(
      this,
    );
  }
}

abstract class _DeviceCalendar extends DeviceCalendar {
  factory _DeviceCalendar(
      {required Calendar calendar,
      required List<Event> events}) = _$DeviceCalendarImpl;
  _DeviceCalendar._() : super._();

  factory _DeviceCalendar.fromJson(Map<String, dynamic> json) =
      _$DeviceCalendarImpl.fromJson;

  @override
  Calendar get calendar;
  set calendar(Calendar value);
  @override
  List<Event> get events;
  set events(List<Event> value);

  /// Create a copy of DeviceCalendar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceCalendarImplCopyWith<_$DeviceCalendarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
