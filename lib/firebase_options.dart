// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'

    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```

// await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform,
// );

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDEX0aINsr1VRzYHHb9YiuWl9pQ6Tg6FAk',
    appId: '1:919332732398:web:8c66289e8cfd6f9f9822ff',
    messagingSenderId: '919332732398',
    projectId: 'isharabuli',
    authDomain: 'isharabuli.firebaseapp.com',
    storageBucket: 'isharabuli.appspot.com',
    measurementId: 'G-FNZT3WKV36',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDn2W-EfFgaFJ-6Yb83y8TgOnB9DBLofGU',
    appId: '1:919332732398:android:e47bd3b5dc8b629c9822ff',
    messagingSenderId: '919332732398',
    projectId: 'isharabuli',
    storageBucket: 'isharabuli.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAC3kHalni2-BCV9aX2QSaRq0GMgRNsRTg',
    appId: '1:919332732398:ios:7eac6522b40f4c5d9822ff',
    messagingSenderId: '919332732398',
    projectId: 'isharabuli',
    storageBucket: 'isharabuli.appspot.com',
    iosClientId: '919332732398-d7ikmb25nnt8qb96flg16mbccdd55hi7.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginSignup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAC3kHalni2-BCV9aX2QSaRq0GMgRNsRTg',
    appId: '1:919332732398:ios:536ab99246bfc85c9822ff',
    messagingSenderId: '919332732398',
    projectId: 'isharabuli',
    storageBucket: 'isharabuli.appspot.com',
    iosClientId: '919332732398-347pp8s1h3sb3tfisaia8t27qs0ao0h2.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginsignup',
  );
}
