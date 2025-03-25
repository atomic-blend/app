// firebase_options.dart

import 'firebase_options_dev.dart' as dev;

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    const flavor = String.fromEnvironment('FLAVOR');

    switch (flavor) {
      case 'prod':
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for prod - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case 'dev':
      default:
        return dev.DefaultFirebaseOptions.currentPlatform;
    }
  }
}