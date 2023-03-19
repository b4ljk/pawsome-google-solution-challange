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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDpIOw6EVXd09vYspd6wP-5GLseTNjdwqM',
    appId: '1:960488407399:web:f4fa8cbeec04feb677afc2',
    messagingSenderId: '960488407399',
    projectId: 'pawsome-59b88',
    authDomain: 'pawsome-59b88.firebaseapp.com',
    storageBucket: 'pawsome-59b88.appspot.com',
    measurementId: 'G-D6M61Q2WJM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPpC1KtIlupw6S5x3kusouZ3u6LueeNuQ',
    appId: '1:960488407399:android:b11046638e0e498377afc2',
    messagingSenderId: '960488407399',
    projectId: 'pawsome-59b88',
    storageBucket: 'pawsome-59b88.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhCqe8Y7CF73f7FztW-GGBBZ3EBuyIv7k',
    appId: '1:960488407399:ios:044c69833c9e2c9b77afc2',
    messagingSenderId: '960488407399',
    projectId: 'pawsome-59b88',
    storageBucket: 'pawsome-59b88.appspot.com',
    iosClientId: '960488407399-9shbovmrocmkbvnaj2bf5aj0pkhpt1i0.apps.googleusercontent.com',
    iosBundleId: 'com.example.bestFlutterUiTemplates',
  );
}
