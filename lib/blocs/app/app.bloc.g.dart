// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppStateImpl _$$AppStateImplFromJson(Map<String, dynamic> json) =>
    _$AppStateImpl(
      pageIndex: (json['pageIndex'] as num).toInt(),
      mobileSyncDisabled: json['mobileSyncDisabled'] as bool?,
      warnUserOnMobileInternetAccess:
          json['warnUserOnMobileInternetAccess'] as bool?,
      isIntroCompleted: json['isIntroCompleted'] as bool?,
      showcasePageStatus:
          (json['showcasePageStatus'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
    );

Map<String, dynamic> _$$AppStateImplToJson(_$AppStateImpl instance) =>
    <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'mobileSyncDisabled': instance.mobileSyncDisabled,
      'warnUserOnMobileInternetAccess': instance.warnUserOnMobileInternetAccess,
      'isIntroCompleted': instance.isIntroCompleted,
      'showcasePageStatus': instance.showcasePageStatus,
    };
