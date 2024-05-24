// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBhYapBqNQ8tKTXhrIf9c2xwxtRTX8gRIg',
    appId: '1:887304359131:web:258cf193c6fca8792d90fe',
    messagingSenderId: '887304359131',
    projectId: 'shoptel-8fdea',
    authDomain: 'shoptel-8fdea.firebaseapp.com',
    storageBucket: 'shoptel-8fdea.appspot.com',
    measurementId: 'G-S4WCXBSXYR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFdEZxJFlyzS6rbyrm_tMOAC0VtHzARMY',
    appId: '1:887304359131:android:2e558d512fda1d142d90fe',
    messagingSenderId: '887304359131',
    projectId: 'shoptel-8fdea',
    storageBucket: 'shoptel-8fdea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDefwa7KuVFqH2f2FA_8Rddl0aPi9KTjGc',
    appId: '1:887304359131:ios:44a3afd62765035c2d90fe',
    messagingSenderId: '887304359131',
    projectId: 'shoptel-8fdea',
    storageBucket: 'shoptel-8fdea.appspot.com',
    iosBundleId: 'com.example.astrohubUser',
  );
}