// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      primaryMenuSelectedKey: json['primaryMenuSelectedKey'] as String,
      secondaryMenuSelectedKey: json['secondaryMenuSelectedKey'] as String,
      mobileSyncDisabled: json['mobileSyncDisabled'] as bool?,
      warnUserOnMobileInternetAccess:
          json['warnUserOnMobileInternetAccess'] as bool?,
      isIntroCompleted: json['isIntroCompleted'] as bool?,
      displayHabitsInCalendar: json['displayHabitsInCalendar'] as bool?,
      showcasePageStatus:
          (json['showcasePageStatus'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'primaryMenuSelectedKey': instance.primaryMenuSelectedKey,
      'secondaryMenuSelectedKey': instance.secondaryMenuSelectedKey,
      'mobileSyncDisabled': instance.mobileSyncDisabled,
      'warnUserOnMobileInternetAccess': instance.warnUserOnMobileInternetAccess,
      'isIntroCompleted': instance.isIntroCompleted,
      'displayHabitsInCalendar': instance.displayHabitsInCalendar,
      'showcasePageStatus': instance.showcasePageStatus,
    };
