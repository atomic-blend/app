import 'dart:convert';
import 'dart:math';
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

  Future<void> restoreDataKey(
      String password, EncryptionKeyEntity keySet) async {
    // Use the salt from the keySet to initialize argon2 correctly
    final saltBytes = base64.decode(keySet.salt);

    // Initialize Argon2 with the correct salt
    final restoreArgon2 = Argon2BytesGenerator();
    final restoreArgon2parameters = Argon2Parameters(
        Argon2Parameters.ARGON2_id, saltBytes,
        desiredKeyLength: 32);
    restoreArgon2.init(restoreArgon2parameters);

    // Generate user key from password
    final passwordBytes = Uint8List.fromList(password.codeUnits);
    final Uint8List uKey = Uint8List(32);
    restoreArgon2.deriveKey(passwordBytes, passwordBytes.length, uKey, 0);

    // Decrypt data key with user key :
    // concat: encrypted data + tag + iv
    final encryptedDataKey = base64.decode(keySet.userKey);
    final iv = encryptedDataKey.sublist(encryptedDataKey.length - 12);
    final tag = encryptedDataKey.sublist(
        encryptedDataKey.length - 28, encryptedDataKey.length - 12);
    final cipherText =
        encryptedDataKey.sublist(0, encryptedDataKey.length - 28);

    final cipher = GCMBlockCipher(AESEngine())
      ..init(false, ParametersWithIV(KeyParameter(uKey), iv));

    final decrypted = cipher.process(cipherText);

    // Verify the authentication tag
    if (tag.length != cipher.mac.length) {
      throw Exception("Authentication failed");
    }
    for (var i = 0; i < tag.length; i++) {
      if (tag[i] != cipher.mac[i]) {
        throw Exception("Authentication failed");
      }
    }

    // Store the data key in the storage
    userKey = base64.encode(decrypted);
    prefs?.setString("key", base64.encode(decrypted));
  }

  static Future<EncryptionKeyEntity?> generateKeySetFromBackupKey({
    required String backupKey,
    required String backupSalt,
    required String mnemonic,
    required String newPassword,
  }) async {
    //check mnemonic validity with bip39

    // parse salt and backup key
    Uint8List mnemonicSalt = base64.decode(backupSalt);
    Uint8List mnemonicKey = Uint8List(32);

    // Initialize Argon2 with the old mnemonic salt
    final mnemonicArgon2 = Argon2BytesGenerator();
    final mnemonicArgon2parameters = Argon2Parameters(
        Argon2Parameters.ARGON2_id, mnemonicSalt,
        desiredKeyLength: 32);
    mnemonicArgon2.init(mnemonicArgon2parameters);

    mnemonicArgon2.deriveKey(
        Uint8List.fromList(mnemonic.codeUnits),
        mnemonic.codeUnits.length,
        mnemonicKey,
        0);

        final encryptedMnemonicDataKey = base64.decode(backupKey);
    final iv = encryptedMnemonicDataKey.sublist(
        encryptedMnemonicDataKey.length - 12);
    final tag = encryptedMnemonicDataKey.sublist(
        encryptedMnemonicDataKey.length - 28,
        encryptedMnemonicDataKey.length - 12);
    final cipherText = encryptedMnemonicDataKey.sublist(  
        0, encryptedMnemonicDataKey.length - 28);

    final mnemonicCipher = GCMBlockCipher(AESEngine())
      ..init(false, ParametersWithIV(KeyParameter(mnemonicKey), iv));
    final decryptedDataKey = mnemonicCipher.process(cipherText);

    // Verify the authentication tag
    if (tag.length != mnemonicCipher.mac.length) {
      throw Exception("Authentication failed");
    }

    for (var i = 0; i < tag.length; i++) {
      if (tag[i] != mnemonicCipher.mac[i]) {
        throw Exception("Authentication failed");
      }
    }

    // Generate a new user key from the new password
    final newKeySet = await generateKeySet(
      newPassword,
      existingDataKey: decryptedDataKey,
    );

    return newKeySet;
  }

  static Future<EncryptionKeyEntity?> generateKeySet(
    String password, {
    Uint8List? existingDataKey,
  }) async {
    //generate user salt
    final userSalt = generateRandomBytes(32);

    // Generate a different salt for the mnemonic - ensure it's different
    Uint8List mnemonicSalt;
    do {
      mnemonicSalt = generateRandomBytes(32);
      // Continue generating until we get a different salt
    } while (bytesEqual(userSalt, mnemonicSalt));

    // init argon2 key derivation
    final argon2 = Argon2BytesGenerator();
    final argon2parameters = Argon2Parameters(
        Argon2Parameters.ARGON2_id, userSalt,
        desiredKeyLength: 32);
    argon2.init(argon2parameters);

    // generate user key from password
    final passwordBytes = Uint8List.fromList(password.codeUnits);
    final Uint8List uKey = Uint8List(32);
    argon2.deriveKey(passwordBytes, passwordBytes.length, uKey, 0);

    // generate random data key or use existing one
    Uint8List dataKey;
    if (existingDataKey != null) {
      dataKey = existingDataKey;
    } else {
      dataKey = generateRandomBytes(32);
    }

    // encrypt data key with user key
    final iv = generateRandomBytes(12);
    final cipher = GCMBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(uKey), iv));
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
    final mnemonicPass = bip39.mnemonicToSeedHex(mnemonic);

    // Create a separate salt for the mnemonic key to ensure uniqueness
    final mnemonicArgon2 = Argon2BytesGenerator();
    final mnemonicArgon2parameters = Argon2Parameters(
        Argon2Parameters.ARGON2_id, mnemonicSalt,
        desiredKeyLength: 32);
    mnemonicArgon2.init(mnemonicArgon2parameters);

    final mnemonicKey = Uint8List(32);
    mnemonicArgon2.deriveKey(Uint8List.fromList(mnemonicPass.codeUnits),
        mnemonicPass.length, mnemonicKey, 0);

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
      backupKey: base64.encode(encryptedMnemonicDataKey),
      salt: base64.encode(userSalt),
      backupPhrase: mnemonic.toString(),
      mnemonicSalt: base64.encode(mnemonicSalt), // Store the mnemonic salt
    );

    // store the data key in the secure storage
    userKey = base64.encode(uKey);
    await prefs?.setString("key", base64.encode(uKey));

    return encryptionKey;
  }

  Future<Uint8List?> hydrateKey() async {
    if (userKey != null) {
      return base64.decode(userKey!);
    }
    return null;
  }

  static Future<Map<String, String>> refreshUserDataKey(
      EncryptionKeyEntity keySet,
      String currentPassword,
      String newPassword) async {
    //////////// DECRYPT USER KEY WITH CURRENT ////////////
    // parse the salt from the keySet
    final userSalt = base64.decode(keySet.salt);

    // init argon2 key derivation
    final argon2 = Argon2BytesGenerator();
    final argon2parameters = Argon2Parameters(
        Argon2Parameters.ARGON2_id, userSalt,
        desiredKeyLength: 32);
    argon2.init(argon2parameters);

    // generate user key from password
    final passwordBytes = Uint8List.fromList(currentPassword.codeUnits);
    final Uint8List uKey = Uint8List(32);
    argon2.deriveKey(passwordBytes, passwordBytes.length, uKey, 0);

    final encryptedDataKey = base64.decode(keySet.userKey);
    final iv = encryptedDataKey.sublist(encryptedDataKey.length - 12);
    final tag = encryptedDataKey.sublist(
        encryptedDataKey.length - 28, encryptedDataKey.length - 12);
    final cipherText =
        encryptedDataKey.sublist(0, encryptedDataKey.length - 28);

    final cipher = GCMBlockCipher(AESEngine())
      ..init(false, ParametersWithIV(KeyParameter(uKey), iv));

    final decryptedDataKey = cipher.process(cipherText);

    // Verify the authentication tag
    if (tag.length != cipher.mac.length) {
      throw Exception("Authentication failed");
    }
    for (var i = 0; i < tag.length; i++) {
      if (tag[i] != cipher.mac[i]) {
        throw Exception("Authentication failed");
      }
    }

    //////////// ENCRYPT USER KEY WITH NEW PASSWORD ////////////
    //generate user salt
    final newUserSalt = generateRandomBytes(32);

    // init argon2 key derivation
    final newArgon2 = Argon2BytesGenerator();
    final newArgon2parameters = Argon2Parameters(
        Argon2Parameters.ARGON2_id, newUserSalt,
        desiredKeyLength: 32);
    newArgon2.init(newArgon2parameters);

    // generate user key from password
    final newPasswordBytes = Uint8List.fromList(newPassword.codeUnits);
    final Uint8List newUKey = Uint8List(32);
    newArgon2.deriveKey(newPasswordBytes, newPasswordBytes.length, newUKey, 0);

    // encrypt data key with user key
    final newIv = generateRandomBytes(12);
    final newCipher = GCMBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(newUKey), newIv));
    final newCipherResult = newCipher.process(decryptedDataKey);
    final newTag = newCipher.mac;

    // concat: encrypted data + tag + iv
    final newEncryptedDataKey =
        Uint8List(newCipherResult.length + newTag.length + newIv.length);
    newEncryptedDataKey.setAll(0, newCipherResult);
    newEncryptedDataKey.setAll(newCipherResult.length, newTag);
    newEncryptedDataKey.setAll(newCipherResult.length + newTag.length, newIv);

    return {
      // to later persist in the app
      "rawUserKey": base64.encode(newUKey),
      // to send to the backend to update the KeySet with new password
      "newEncryptedDataKey": base64.encode(newEncryptedDataKey),
      "newUserSalt": base64.encode(newUserSalt),
    };
  }

  static Future<bool?> persistNewUserKey(Uint8List userKey) async {
    userKey = userKey;
    return await prefs?.setString("key", base64.encode(userKey));
  }

  static Uint8List generateRandomBytes(int numBytes) {
    // Create a seed that's exactly 32 bytes (256 bits) as required by Fortuna
    final Uint8List seed = Uint8List(32);

    // Fill first part with sequential data
    for (int i = 0; i < 16; i++) {
      seed[i] = i;
    }

    // Add timestamp to ensure different results on each call
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final timestampBytes = timestamp.toString().codeUnits;

    // Fill the remaining bytes with timestamp data (making sure not to exceed 32 bytes)
    for (int i = 0; i < min(timestampBytes.length, 16); i++) {
      seed[16 + i] = timestampBytes[i];
    }

    final secureRandom = SecureRandom('Fortuna')..seed(KeyParameter(seed));

    return secureRandom.nextBytes(numBytes);
  }

  // Helper method to compare byte arrays
  static bool bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
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

  Future<String> decryptString({
    required String data,
  }) async {
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
        try {
          return json.decode(decryptedValue);
        } catch (e) {
          // If cannot decode as JSON, return as is (might be a date string or other primitive)
          return decryptedValue;
        }
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

    if (data is List) {
      return await Future.wait(
          data.map((item) => _processJsonValue(item, false)));
    }

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
