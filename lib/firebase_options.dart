// ignore_for_file: uri_does_not_exist
// firebase_options.dart

import 'package:app/firebase_options_prod.dart' as prod;

import 'firebase_options_dev.dart' as dev;

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    const flavor = String.fromEnvironment('APP_ENV');

    switch (flavor) {
      case 'prod':
        return prod.DefaultFirebaseOptions.currentPlatform;
      case 'dev':
      default:
        return dev.DefaultFirebaseOptions.currentPlatform;
    }
  }
}