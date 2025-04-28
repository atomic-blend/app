import 'dart:convert';
import 'package:app/flavors.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'env.freezed.dart';
part 'env.g.dart';

@freezed
@singleton
@preResolve
class EnvModel with _$EnvModel {
  factory EnvModel({
    required String env,
    required bool debug,
    required bool debugShowCheckedModeBanner,
    required bool debugShowMaterialGrid,
    required bool debugApiClient,
    required String restApiUrl,
    required String appleRevenueCatApiKey,
    required String googleRevenueCatApiKey,
  }) = _EnvModel;

  EnvModel._();

  factory EnvModel.fromJson(Map<String, dynamic> json) =>
      _$EnvModelFromJson(json);

  @factoryMethod
  static Future<EnvModel> create() async {
    final env = F.appFlavor?.name;
    if (env == null) {
      throw Exception('App flavor not found');
    }
    final rawEnvData = await rootBundle.loadString(
      'assets/configs/$env.json',
    );
    final jsonEnvData = jsonDecode(rawEnvData) as Map<String, dynamic>;
    const restApiUrl = String.fromEnvironment('REST_API_URL', defaultValue: '');
    if (restApiUrl != '') {
      jsonEnvData['restApiUrl'] = restApiUrl;
    }

    const appleRevenueCatApiKey =
        String.fromEnvironment('APPLE_REVENUE_CAT_API_KEY', defaultValue: '');
    if (appleRevenueCatApiKey != '') {
      jsonEnvData['appleRevenueCatApiKey'] = appleRevenueCatApiKey;
    }
    const googleRevenueCatApiKey =
        String.fromEnvironment('GOOGLE_REVENUE_CAT_API_KEY', defaultValue: '');
    if (googleRevenueCatApiKey != '') {
      jsonEnvData['googleRevenueCatApiKey'] = googleRevenueCatApiKey;
    }

    return EnvModel.fromJson(jsonEnvData);
  }

  bool get isRelease => env.split('_').contains('release');
}
