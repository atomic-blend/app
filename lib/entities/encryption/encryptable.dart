import 'package:app/services/encryption.service.dart';
import 'package:equatable/equatable.dart';

abstract class Encryptable extends Equatable {
  List<String> get nonEncryptedFields;

  Future<Map<String, dynamic>> encrypt(
      Map<String, dynamic> json, EncryptionService encryptionService) async {
    throw UnimplementedError();
  }
}
