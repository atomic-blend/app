import 'package:freezed_annotation/freezed_annotation.dart';

part 'userRole.entity.freezed.dart';
part 'userRole.entity.g.dart';
// ignore_for_file: non_constant_identifier_names

@freezed
class UserRoleEntity with _$UserRoleEntity {
  factory UserRoleEntity({
    required String id,
    required String name,
    required DateTime creation_date,
    required DateTime last_updated,
  }) = _UserRoleEntity;

  @override
  toString() =>
      'UserRoleEntity { id: $id, name: $name, creation_date: $creation_date, last_updated: $last_updated }';

  factory UserRoleEntity.fromJson(Map<String, dynamic> json) =>
      _$UserRoleEntityFromJson(json);
}
