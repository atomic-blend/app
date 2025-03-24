import 'package:app/entities/encryption/encryption_key.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.entity.freezed.dart';
part 'user.entity.g.dart';
// ignore_for_file: non_constant_identifier_names

@unfreezed
class UserEntity with _$UserEntity {
  const UserEntity._();
  factory UserEntity({
    String? id,
    String? firebase_id,
    required String? email,
    required List<dynamic> roles,
    List<dynamic>? purchases,
    String? firstname,
    String? lastname,
    String? refreshToken,
    required EncryptionKeyEntity keySet,
    String? accessToken,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserEntity;

  @override
  String toString() {
    return 'UserEntity { id: $id, roles: $roles, firebase_id: $firebase_id, email: $email, name: $firstname, lastname: $lastname, purchases: $purchases, createdAt: $createdAt, updatedAt: $updatedAt }';
  }

  String? displayName() {
    if (firstname == null && lastname == null) {
      return email;
    }
    return '${firstname ?? ''} ${lastname ?? ''}';
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
