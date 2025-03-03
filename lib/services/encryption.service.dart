import 'dart:convert';
import 'dart:typed_data';

import 'package:app/main.dart';
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

  Future<void> deriveAndPersistKey(String password) async {
    final passwordBytes = Uint8List.fromList(password.codeUnits);
    final Uint8List derivedKey = Uint8List(32);
    argon2.deriveKey(passwordBytes, passwordBytes.length, derivedKey, 0);
    await prefs?.setString("user_key", base64.encode(derivedKey));
  }

  Future<Uint8List?> hydrateKey() async {
    final userKey = prefs?.getString("user_key");
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
