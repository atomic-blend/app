import 'package:freezed_annotation/freezed_annotation.dart';

part 'encryption_key.freezed.dart';
part 'encryption_key.g.dart';

@unfreezed
class EncryptionKeyEntity with _$EncryptionKeyEntity {
  const EncryptionKeyEntity._();
  factory EncryptionKeyEntity({
    // the encryption key encrypted with pwd derived key
    required String userKey,
    // the encryption key encrypted with backup key
    required String backupKey,
    // the salt used to derive the encryption key
    required String salt,
    // the salt used to derive the mnemonic
    required String mnemonicSalt,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) String? backupPhrase,
  }) = _EncryptionKeyEntity;

  @override
  String toString() {
    return 'EncryptionKeyEntity { userKey: $userKey, backupKey: $backupKey, salt: $salt }';
  }

  factory EncryptionKeyEntity.fromJson(Map<String, dynamic> json) =>
      _$EncryptionKeyEntityFromJson(json);
}
