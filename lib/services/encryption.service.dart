import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:app/entities/encryption/encryption_key.dart';
import 'package:app/main.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:flutter_age/flutter_age.dart';
import 'package:pointycastle/block/aes.dart';
import 'package:pointycastle/block/modes/gcm.dart';
import 'package:pointycastle/key_derivators/argon2.dart';
import 'package:pointycastle/pointycastle.dart';

class EncryptionService {
  late Uint8List userSalt;
  final argon2 = Argon2BytesGenerator();

  EncryptionService({required String userSalt}) {
    this.userSalt = Uint8List.fromList(utf8.encode(userSalt));
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
    final passwordBytes = Uint8List.fromList(utf8.encode(password));
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

    final dataKey = cipher.process(cipherText);

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
    userKey = utf8.decode(dataKey);
    prefs?.setString("key", userKey ?? "");

    // Store the age public key in the storage
    agePublicKey = keySet.publicKey;
    prefs?.setString("agePublicKey", keySet.publicKey ?? "");
  }

  static Future<EncryptionKeyEntity?> generateKeySetFromBackupKey({
    required String backupKey,
    required String backupSalt,
    required String mnemonic,
    required String newPassword,
    required String? agePublicKey,
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

    mnemonicArgon2.deriveKey(Uint8List.fromList(utf8.encode(mnemonic)),
        utf8.encode(mnemonic).length, mnemonicKey, 0);

    final encryptedMnemonicDataKey = base64.decode(backupKey);
    final iv =
        encryptedMnemonicDataKey.sublist(encryptedMnemonicDataKey.length - 12);
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
      existingAgePrivateKey: utf8.decode(decryptedDataKey),
      existingAgePublicKey: agePublicKey,
    );

    return newKeySet;
  }

  static Future<EncryptionKeyEntity?> generateKeySet(
    String password, {
    String? existingAgePrivateKey,
    String? existingAgePublicKey,
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
    final passwordBytes = Uint8List.fromList(utf8.encode(password));
    final Uint8List uKey = Uint8List(32);
    argon2.deriveKey(passwordBytes, passwordBytes.length, uKey, 0);

    // generate random data key or use existing one
    AgeKey? dataKey;
    if (existingAgePrivateKey != null && existingAgePublicKey != null) {
      dataKey = AgeKey(privateKey: existingAgePrivateKey, publicKey: existingAgePublicKey);
    } else {
      dataKey = createKey();
    }

    // encrypt data key with user key
    final iv = generateRandomBytes(12);
    final cipher = GCMBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(uKey), iv));
    final cipheResult = cipher.process(Uint8List.fromList(utf8.encode(dataKey.privateKey)));
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
    mnemonicArgon2.deriveKey(Uint8List.fromList(utf8.encode(mnemonicPass)),
        mnemonicPass.length, mnemonicKey, 0);

    final mnemonicIv = generateRandomBytes(12);
    final mnemonicCipher = GCMBlockCipher(AESEngine())
      ..init(true, ParametersWithIV(KeyParameter(mnemonicKey), mnemonicIv));

    // encrypt data key with mnemonic key
    final mnemonicCipherResult = mnemonicCipher.process(Uint8List.fromList(utf8.encode(dataKey.privateKey)));
    final mnemonicTag = mnemonicCipher.mac;

    // concat: encrypted data + tag + iv
    final encryptedMnemonicDataKey = Uint8List(
        mnemonicCipherResult.length + mnemonicTag.length + mnemonicIv.length);
    encryptedMnemonicDataKey.setAll(0, mnemonicCipherResult);
    encryptedMnemonicDataKey.setAll(mnemonicCipherResult.length, mnemonicTag);
    encryptedMnemonicDataKey.setAll(
        mnemonicCipherResult.length + mnemonicTag.length, mnemonicIv);

    // store the keys and mnemonic
    //TODO: [DONE] add public key to the keySet + type to age_v1
    final EncryptionKeyEntity encryptionKey = EncryptionKeyEntity(
      userKey: base64.encode(encryptedDataKey),
      backupKey: base64.encode(encryptedMnemonicDataKey),
      salt: base64.encode(userSalt),
      backupPhrase: mnemonic.toString(),
      mnemonicSalt: base64.encode(mnemonicSalt), // Store the mnemonic salt
      publicKey: dataKey.publicKey,
      type: "age_v1",
    );

    // store the data key in the secure storage
    userKey = dataKey.privateKey;
    await prefs?.setString("key", dataKey.privateKey);

    // store the age public key in the storage
    agePublicKey = dataKey.publicKey;
    await prefs?.setString("agePublicKey", dataKey.publicKey);

    return encryptionKey;
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
    final passwordBytes = Uint8List.fromList(utf8.encode(currentPassword));
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
    final newPasswordBytes = Uint8List.fromList(utf8.encode(newPassword));
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

  static Future<bool?> persistNewUserKey(String agePrivateKey) async {
    userKey = agePrivateKey;
    return await prefs?.setString("key", agePrivateKey);
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
    final timestampBytes = utf8.encode(timestamp.toString());

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
    final key = agePublicKey;
    if (key == null) {
      throw Exception("Key not found");
    }

    // encrypt with age key
    final encrypted = encryptData(data: Uint8List.fromList(utf8.encode(data)), publicKey: key);

    return encrypted;
  }

  Future<String> decryptString({
    required String data,
  }) async {
    final key = userKey;
    if (key == null) {
      throw Exception("Key not found");
    }

    // decrypt with age key
    final decrypted = decryptData(encryptedDataBase64: data, privateKey: key);

    return utf8.decode(decrypted);
  }

  Future<dynamic> _processJsonValue(dynamic value, bool encrypt) async {
    if (value == null) return null;

    // Handle different Map types
    if (value is Map) {
      return await (encrypt ? encryptJson(value) : decryptJson(value));
    } 
    // Handle different List types
    else if (value is List) {
      return await Future.wait(
          value.map((item) => _processJsonValue(item, encrypt)));
    } 
    // Handle Set types
    else if (value is Set) {
      List<dynamic> listValue = value.toList();
      List<dynamic> processedList = await Future.wait(
          listValue.map((item) => _processJsonValue(item, encrypt)));
      return Set.from(processedList);
    }
    // Handle DateTime objects
    else if (value is DateTime) {
      if (encrypt) {
        String dateString = value.toIso8601String();
        return await encryptString(data: dateString);
      } else {
        String decryptedValue = await decryptString(data: value.toString());
        try {
          return DateTime.parse(decryptedValue);
        } catch (e) {
          return decryptedValue;
        }
      }
    }
    // Handle Duration objects
    else if (value is Duration) {
      if (encrypt) {
        String durationString = value.inMicroseconds.toString();
        return await encryptString(data: durationString);
      } else {
        String decryptedValue = await decryptString(data: value.toString());
        try {
          int microseconds = int.parse(decryptedValue);
          return Duration(microseconds: microseconds);
        } catch (e) {
          return decryptedValue;
        }
      }
    }
    // Handle Uri objects
    else if (value is Uri) {
      if (encrypt) {
        String uriString = value.toString();
        return await encryptString(data: uriString);
      } else {
        String decryptedValue = await decryptString(data: value.toString());
        try {
          return Uri.parse(decryptedValue);
        } catch (e) {
          return decryptedValue;
        }
      }
    }
    // Handle RegExp objects
    else if (value is RegExp) {
      if (encrypt) {
        Map<String, dynamic> regexData = {
          'pattern': value.pattern,
          'isMultiLine': value.isMultiLine,
          'isCaseSensitive': value.isCaseSensitive,
          'isDotAll': value.isDotAll,
          'isUnicode': value.isUnicode,
        };
        return await encryptString(data: json.encode(regexData));
      } else {
        String decryptedValue = await decryptString(data: value.toString());
        try {
          Map<String, dynamic> regexData = json.decode(decryptedValue);
          return RegExp(
            regexData['pattern'],
            multiLine: regexData['isMultiLine'] ?? false,
            caseSensitive: regexData['isCaseSensitive'] ?? true,
            dotAll: regexData['isDotAll'] ?? false,
            unicode: regexData['isUnicode'] ?? false,
          );
        } catch (e) {
          return decryptedValue;
        }
      }
    }
    // Handle BigInt objects
    else if (value is BigInt) {
      if (encrypt) {
        String bigIntString = value.toString();
        return await encryptString(data: bigIntString);
      } else {
        String decryptedValue = await decryptString(data: value.toString());
        try {
          return BigInt.parse(decryptedValue);
        } catch (e) {
          return decryptedValue;
        }
      }
    }
    // Handle Uint8List and other typed lists
    else if (value is Uint8List) {
      if (encrypt) {
        String bytesString = base64.encode(value);
        return await encryptString(data: bytesString);
      } else {
        String decryptedValue = await decryptString(data: value.toString());
        try {
          return base64.decode(decryptedValue);
        } catch (e) {
          return decryptedValue;
        }
      }
    }
    // Handle other primitive types (String, int, double, bool)
    else if (value is String || value is int || value is double || value is bool) {
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
    // Handle any other type by converting to JSON
    else {
      if (encrypt) {
        String jsonValue = json.encode(value);
        return await encryptString(data: jsonValue);
      } else {
        String decryptedValue = await decryptString(data: value.toString());
        try {
          return json.decode(decryptedValue);
        } catch (e) {
          // If cannot decode as JSON, return as is
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
