import 'dart:convert';
import 'dart:typed_data';

import 'package:app/entities/encryption/encryption_key.dart';
import 'package:app/main.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:pointycastle/block/aes.dart';
import 'package:pointycastle/block/modes/gcm.dart';
import 'package:pointycastle/key_derivators/argon2_native_int_impl.dart';
import 'package:pointycastle/pointycastle.dart';

class EncryptionService {
  late Uint8List userSalt;
  final argon2 = Argon2BytesGenerator();

  EncryptionService({required String userSalt}) {
    this.userSalt = Uint8List.fromList(userSalt.codeUnits);
    final argon2parameters = Argon2Parameters(
        Argon2Parameters.ARGON2_id, this.userSalt,
        desiredKeyLength: 32);
    argon2.init(argon2parameters);
  }

  //TODO: restore data key on login
  Future<void> restoreDataKey(String password, EncryptionKeyEntity keySet) async {
    // generate user key from password
    final passwordBytes = Uint8List.fromList(password.codeUnits);
    final Uint8List userKey = Uint8List(32);
    argon2.deriveKey(passwordBytes, passwordBytes.length, userKey, 0);

    // decrypt data key with user key
    final encryptedDataKey = base64.decode(keySet.userKey);
    final iv = encryptedDataKey.sublist(encryptedDataKey.length - 12);
    final tag = encryptedDataKey.sublist(encryptedDataKey.length - 28, encryptedDataKey.length - 12);
    final cipherText = encryptedDataKey.sublist(0, encryptedDataKey.length - 28);

    final cipher = GCMBlockCipher(AESEngine())
      ..init(false, ParametersWithIV(KeyParameter(userKey), iv));

    final decrypted = cipher.process(cipherText);

    if (tag.length != cipher.mac.length) {
      throw Exception("Authentication failed");
    }
    for (var i = 0; i < tag.length; i++) {
      if (tag[i] != cipher.mac[i]) {
        throw Exception("Authentication failed");
      }
    }

    // store the data key in the storage
    prefs?.setString("key", base64.encode(decrypted));
  }

  //TODO: generate key set on register
  static Future<EncryptionKeyEntity?> generateKeySet(String password) async {
    //generate user salt
    final userSalt = generateRandomBytes(32);

    // init argon2 key derivation
    final argon2 = Argon2BytesGenerator();
    final argon2parameters = Argon2Parameters(
        Argon2Parameters.ARGON2_id, userSalt,
        desiredKeyLength: 32);
    argon2.init(argon2parameters);

    // generate user key from password
    final passwordBytes = Uint8List.fromList(password.codeUnits);
    final Uint8List userKey = Uint8List(32);
    argon2.deriveKey(passwordBytes, passwordBytes.length, userKey, 0);

    // generate random data key
    final dataKey = generateRandomBytes(32);

    // encrypt data key with user key
    final iv = generateRandomBytes(12);
    final cipher = GCMBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(userKey), iv));
    final cipheResult = cipher.process(dataKey);
    final tag = cipher.mac;

    // concat: encrypted data + tag + iv
    final encryptedDataKey =
        Uint8List(cipheResult.length + tag.length + iv.length);
    encryptedDataKey.setAll(0, cipheResult);
    encryptedDataKey.setAll(cipheResult.length, tag);
    encryptedDataKey.setAll(cipheResult.length + tag.length, iv);

    // generate the backup mnemonic
    var mnemonic = bip39.generateMnemonic();
    final mnemonicKey = bip39.mnemonicToSeed(mnemonic);
    final mnemonicIv = generateRandomBytes(12);
    final mnemonicCipher = GCMBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(mnemonicKey), mnemonicIv));

    // encrypt data key with mnemonic key
    final mnemonicCipherResult = mnemonicCipher.process(dataKey);
    final mnemonicTag = mnemonicCipher.mac;

    // concat: encrypted data + tag + iv
    final encryptedMnemonicDataKey = Uint8List(
        mnemonicCipherResult.length + mnemonicTag.length + mnemonicIv.length);
    encryptedMnemonicDataKey.setAll(0, mnemonicCipherResult);
    encryptedMnemonicDataKey.setAll(mnemonicCipherResult.length, mnemonicTag);
    encryptedMnemonicDataKey.setAll(
        mnemonicCipherResult.length + mnemonicTag.length, mnemonicIv);

    // store the keys and mnemonic
    final EncryptionKeyEntity encryptionKey = EncryptionKeyEntity(
      userKey: base64.encode(encryptedDataKey),
      backupKey: "",
      salt: base64.encode(userSalt),
      backupPhrase: mnemonic,
    );

    // store the data key in the secure storage
    await prefs?.setString("key", base64.encode(dataKey));

    return encryptionKey;
  }

  Future<Uint8List?> hydrateKey() async {
    final userKey = prefs?.getString("key");
    if (userKey != null) {
      return base64.decode(userKey);
    }
    return null;
  }

  static Uint8List generateRandomBytes(int numBytes) {
    final secureRandom = SecureRandom('Fortuna')
      ..seed(
          KeyParameter(Uint8List.fromList(List<int>.generate(32, (i) => i))));
    return secureRandom.nextBytes(numBytes);
  }

  Future<String> encryptString({required String data}) async {
    final key = await hydrateKey();
    if (key == null) {
      throw Exception("Key not found");
    }
    final iv = generateRandomBytes(12);
    final cipher = GCMBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(key), iv));

    final dataBytes = Uint8List.fromList(utf8.encode(data));
    final cipherText = cipher.process(dataBytes);
    final tag = cipher.mac;

    // Concaténer dans l'ordre : données chiffrées + tag + iv
    final result = Uint8List(cipherText.length + tag.length + iv.length);
    result.setAll(0, cipherText);
    result.setAll(cipherText.length, tag);
    result.setAll(cipherText.length + tag.length, iv);

    return base64.encode(result);
  }

  Future<String> decryptString({required String data}) async {
    final key = await hydrateKey();
    if (key == null) {
      throw Exception("Key not found");
    }

    final allBytes = base64.decode(data);
    final iv = allBytes.sublist(allBytes.length - 12);
    final tag = allBytes.sublist(allBytes.length - 28, allBytes.length - 12);
    final cipherText = allBytes.sublist(0, allBytes.length - 28);

    final cipher = GCMBlockCipher(AESEngine())
      ..init(false, ParametersWithIV(KeyParameter(key), iv));

    final decrypted = cipher.process(cipherText);

    // Vérification manuelle du tag
    if (tag.length != cipher.mac.length) {
      throw Exception("Authentication failed");
    }
    for (var i = 0; i < tag.length; i++) {
      if (tag[i] != cipher.mac[i]) {
        throw Exception("Authentication failed");
      }
    }

    return utf8.decode(decrypted);
  }

  Future<dynamic> _processJsonValue(dynamic value, bool encrypt) async {
    if (value == null) return null;

    if (value is Map<String, dynamic>) {
      return await (encrypt ? encryptJson(value) : decryptJson(value));
    } else if (value is List) {
      return await Future.wait(
          value.map((item) => _processJsonValue(item, encrypt)));
    } else {
      if (encrypt) {
        String jsonValue = json.encode(value);
        return await encryptString(data: jsonValue);
      } else {
        String decryptedValue = await decryptString(data: value.toString());
        return json.decode(decryptedValue);
      }
    }
  }

  Future<dynamic> encryptJson(dynamic data) async {
    if (data == null) return null;
    if (data.runtimeType != Map) {
      return await encryptString(data: data);
    }
    Map<String, dynamic> encryptedData = {};

    for (var entry in data.entries) {
      encryptedData[entry.key] = await _processJsonValue(entry.value, true);
    }

    return encryptedData;
  }

  Future<dynamic> decryptJson(dynamic data) async {
    if (data == null) return null;
    if (data.runtimeType != Map) {
      return await decryptString(data: data);
    }
    Map<String, dynamic> decryptedData = {};

    for (var entry in data.entries) {
      decryptedData[entry.key] = await _processJsonValue(entry.value, false);
    }

    return decryptedData;
  }
}
